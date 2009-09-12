// Un-comment the following line for diagnostic output
// #define DIAGNOSTICWRITELINE

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Markup;
using System.Windows.Media;
#if !SILVERLIGHT
using System.IO;
using System.Text;
#endif

namespace Cjc.SilverGlulxe
{
    /// <summary>
    /// Control that implements support for transformations as if applied by
    /// LayoutTransform (which does not exist in Silverlight).
    /// </summary>
    [ContentProperty("Child")]
    public class LayoutTransformControl : Control
    {
        /// <summary>
        /// The single child of the LayoutTransformControl.
        /// </summary>
        /// <remarks>
        /// Corresponds to WPF's Decorator.Child (ex: Border, Viewbox).
        /// </remarks>
        public FrameworkElement Child
        {
            get { return (FrameworkElement)GetValue(ContentProperty); }
            set { SetValue(ContentProperty, value); }
        }
        public static readonly DependencyProperty ContentProperty = DependencyProperty.Register(
            "Child", typeof(FrameworkElement), typeof(LayoutTransformControl), new PropertyMetadata(ChildChanged));

        /// <summary>
        /// The Transform of the LayoutTransformControl.
        /// </summary>
        /// <remarks>
        /// Corresponds to UIElement.RenderTransform.
        /// </remarks>
        public Transform Transform
        {
            get { return (Transform)GetValue(TransformProperty); }
            set { SetValue(TransformProperty, value); }
        }
        public static readonly DependencyProperty TransformProperty = DependencyProperty.Register(
            "Transform", typeof(Transform), typeof(LayoutTransformControl), new PropertyMetadata(TransformChanged));

        // AcceptableDelta and DecimalsAfterRound work around double arithmetic rounding issues on Silverlight
        private const double AcceptableDelta = 0.0001;
        private const int DecimalsAfterRound = 4;

        // Host panel for Child element
        private Panel _layoutRoot;

        // RenderTransform/MatrixTransform applied to _layoutRoot
        private MatrixTransform _matrixTransform;

        // Transformation matrix corresponding to _matrixTransform
        private Matrix _transformation;

        // Actual DesiredSize of Child element (i.e., the value it returned from its MeasureOverride method)
        private Size _childActualSize = Size.Empty;

        /// <summary>
        /// Initializes a new instance of the LayoutTransformControl class.
        /// </summary>
        public LayoutTransformControl()
        {
            // Can't tab to LayoutTransformControl
            IsTabStop = false;
#if SILVERLIGHT
            // Disable layout rounding because its rounding of values confuses things
            UseLayoutRounding = false;
#endif
            // Hard coded template is never meant to be changed and avoids the need for generic.xaml
            var templateXaml =
                @"<ControlTemplate " +
#if SILVERLIGHT
                    "xmlns='http://schemas.microsoft.com/client/2007' " +
#else
                    "xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation' " +
#endif
                    "xmlns:x='http://schemas.microsoft.com/winfx/2006/xaml'>" +
                    "<Grid x:Name='LayoutRoot' Background='{TemplateBinding Background}'>" +
                        "<Grid.RenderTransform>" +
                            "<MatrixTransform x:Name='MatrixTransform'/>" +
                        "</Grid.RenderTransform>" +
                    "</Grid>" +
                "</ControlTemplate>";
#if SILVERLIGHT
            Template = (ControlTemplate)XamlReader.Load(templateXaml);
#else
            using(var stream = new MemoryStream(Encoding.UTF8.GetBytes(templateXaml)))
            {
                Template = (ControlTemplate)XamlReader.Load(stream);
            }
#endif
        }

        /// <summary>
        /// Called whenever the control's template changes.
        /// </summary>
        public override void OnApplyTemplate()
        {
            // Save existing content and remove it from the visual tree
            var savedContent = Child;
            Child = null;
            // Apply new template
            base.OnApplyTemplate();
            // Find template parts
            _layoutRoot = GetTemplateChild("LayoutRoot") as Panel;
            _matrixTransform = GetTemplateChild("MatrixTransform") as MatrixTransform;
            // Restore saved content
            Child = savedContent;
            // Apply the current transform
            TransformUpdated();
        }

        // Handle changes to the Child DependencyProperty
        private static void ChildChanged(DependencyObject o, DependencyPropertyChangedEventArgs e)
        {
            // Casts are safe because Silverlight is enforcing the types
            ((LayoutTransformControl)o).OnChildChanged((FrameworkElement)e.NewValue);
        }
        private void OnChildChanged(FrameworkElement newContent)
        {
            if (null != _layoutRoot)
            {
                // Clear current child
                _layoutRoot.Children.Clear();
                if (null != newContent)
                {
                    // Add the new child to the tree
                    _layoutRoot.Children.Add(newContent);
                }
                // New child means re-layout is necessary
                InvalidateMeasure();
            }
        }

        // Handle changes to the Transform DependencyProperty
        private static void TransformChanged(DependencyObject o, DependencyPropertyChangedEventArgs e)
        {
            // Casts are safe because Silverlight is enforcing the types
            ((LayoutTransformControl)o).OnTransformChanged((Transform)e.NewValue);
        }
        private void OnTransformChanged(Transform newValue)
        {
            ProcessTransform(newValue);
        }

        /// <summary>
        /// Notifies the LayoutTransformControl that some aspect of its Transform property has changed.
        /// </summary>
        /// <remarks>
        /// Call this to update the LayoutTransform in cases where LayoutTransformControl wouldn't otherwise know to do so.
        /// </remarks>
        public void TransformUpdated()
        {
            ProcessTransform(Transform);
        }

        // Processes the current Transform to determine the corresponding matrix
        private void ProcessTransform(Transform transform)
        {
            // Get the transform matrix and apply it
            _transformation = RoundMatrix(GetTransformMatrix(transform), DecimalsAfterRound);
            if (null != _matrixTransform)
            {
                _matrixTransform.Matrix = _transformation;
            }
            // New transform means re-layout is necessary
            InvalidateMeasure();
        }

        // Walks the Transform(Group) and returns the corresponding matrix
        private Matrix GetTransformMatrix(Transform transform)
        {
            if (null != transform)
            {
                // WPF equivalent of this entire method:
                // return transform.Value;

                // Process the TransformGroup
                var transformGroup = transform as TransformGroup;
                if (null != transformGroup)
                {
                    Matrix groupMatrix = Matrix.Identity;
                    foreach (var child in transformGroup.Children)
                    {
                        groupMatrix = MatrixMultiply(groupMatrix, GetTransformMatrix(child));
                    }
                    return groupMatrix;
                }

                // Process the RotateTransform
                var rotateTransform = transform as RotateTransform;
                if (null != rotateTransform)
                {
                    var angle = rotateTransform.Angle;
                    var angleRadians = (2 * Math.PI * angle) / 360;
                    var sine = Math.Sin(angleRadians);
                    var cosine = Math.Cos(angleRadians);
                    return new Matrix(cosine, sine, -sine, cosine, 0, 0);
                }

                // Process the ScaleTransform
                var scaleTransform = transform as ScaleTransform;
                if (null != scaleTransform)
                {
                    var scaleX = scaleTransform.ScaleX;
                    var scaleY = scaleTransform.ScaleY;
                    return new Matrix(scaleX, 0, 0, scaleY, 0, 0);
                }

                // Process the SkewTransform
                var skewTransform = transform as SkewTransform;
                if (null != skewTransform)
                {
                    var angleX = skewTransform.AngleX;
                    var angleY = skewTransform.AngleY;
                    var angleXRadians = (2 * Math.PI * angleX) / 360;
                    var angleYRadians = (2 * Math.PI * angleY) / 360;
                    return new Matrix(1, angleYRadians, angleXRadians, 1, 0, 0);
                }

                // Process the MatrixTransform
                var matrixTransform = transform as MatrixTransform;
                if (null != matrixTransform)
                {
                    return matrixTransform.Matrix;
                }

                // TranslateTransform has no effect in LayoutTransform
            }

            // Fall back to no-op transformation
            return Matrix.Identity;
        }

        /// <summary>
        /// Provides the behavior for the "Measure" pass of layout.
        /// </summary>
        /// <param name="availableSize">The available size that this element can give to child elements. Infinity can be specified as a value to indicate that the element will size to whatever content is available.</param>
        /// <returns>The size that this element determines it needs during layout, based on its calculations of child element sizes.</returns>
        protected override Size MeasureOverride(Size availableSize)
        {
            var child = Child;
            if ((null == _layoutRoot) || (null == child))
            {
                // No content, no size
                return Size.Empty;
            }

            DiagnosticWriteLine("MeasureOverride < " + availableSize);
            Size measureSize;
            if (_childActualSize == Size.Empty)
            {
                // Determine the largest size after the transformation
                measureSize = ComputeLargestTransformedSize(availableSize);
            }
            else
            {
                // Previous measure/arrange pass determined that Child.DesiredSize was larger than believed
                DiagnosticWriteLine("  Using _childActualSize");
                measureSize = _childActualSize;
            }

            // Perform a mesaure on the _layoutRoot (containing Child)
            DiagnosticWriteLine("  _layoutRoot.Measure < " + measureSize);
            _layoutRoot.Measure(measureSize);
            DiagnosticWriteLine("  _layoutRoot.DesiredSize = " + _layoutRoot.DesiredSize);

            // WPF equivalent of _childActualSize technique (much simpler, but doesn't work on Silverlight 2)
            //// If the child is going to render larger than the available size, re-measure according to that size
            //child.Arrange(new Rect());
            //if (child.RenderSize != child.DesiredSize)
            //{
            //    _layoutRoot.Measure(child.RenderSize);
            //}

            // Transform DesiredSize to find its width/height
            var transformedDesiredRect = RectTransform(new Rect(0, 0, _layoutRoot.DesiredSize.Width, _layoutRoot.DesiredSize.Height), _transformation);
            var transformedDesiredSize = new Size(transformedDesiredRect.Width, transformedDesiredRect.Height);

            // Return result to allocate enough space for the transformation
            DiagnosticWriteLine("MeasureOverride > " + transformedDesiredSize);
            return transformedDesiredSize;
        }

        /// <summary>
        /// Provides the behavior for the "Arrange" pass of layout.
        /// </summary>
        /// <param name="finalSize">The final area within the parent that this element should use to arrange itself and its children.</param>
        /// <returns>The actual size used.</returns>
        /// <remarks>
        /// Using the WPF paramater name finalSize instead of Silverlight's finalSize for clarity
        /// </remarks>
        protected override Size ArrangeOverride(Size finalSize)
        {
            var child = Child;
            if ((null == _layoutRoot) || (null == child))
            {
                // No child, use whatever was given
                return finalSize;
            }

            DiagnosticWriteLine("ArrangeOverride < " + finalSize);
            // Determine the largest available size after the transformation
            var finalSizeTransformed = ComputeLargestTransformedSize(finalSize);
            if(IsSizeSmaller(finalSizeTransformed, _layoutRoot.DesiredSize))
            {
                // Some elements do not like being given less space than they asked for (ex: TextBlock)
                // Bump the working size up to do the right thing by them
                DiagnosticWriteLine("  Replacing finalSizeTransformed with larger _layoutRoot.DesiredSize");
                finalSizeTransformed = _layoutRoot.DesiredSize;
            }
            DiagnosticWriteLine("  finalSizeTransformed = " + finalSizeTransformed);

            // Transform the working size to find its width/height
            var transformedRect = RectTransform(new Rect(0, 0, finalSizeTransformed.Width, finalSizeTransformed.Height), _transformation);
            // Create the Arrange rect to center the transformed content
            var finalRect = new Rect(
                -transformedRect.Left + ((finalSize.Width - transformedRect.Width) / 2),
                -transformedRect.Top + ((finalSize.Height - transformedRect.Height) / 2),
                finalSizeTransformed.Width,
                finalSizeTransformed.Height);

            // Perform an Arrange on _layoutRoot (containing Child)
            DiagnosticWriteLine("  _layoutRoot.Arrange < " + finalRect);
            _layoutRoot.Arrange(finalRect);
            DiagnosticWriteLine("  Child.RenderSize = " + child.RenderSize);

            // This is the first opportunity under Silverlight to find out the Child's true DesiredSize
            if (IsSizeSmaller(finalSizeTransformed, child.RenderSize) && (Size.Empty == _childActualSize))
            {
                // Unfortunately, all the work so far is invalid because the wrong DesiredSize was used
                DiagnosticWriteLine("  finalSizeTransformed smaller than Child.RenderSize");
                // Make a note of the actual DesiredSize
                _childActualSize = new Size(child.ActualWidth, child.ActualHeight);
                DiagnosticWriteLine("  _childActualSize = " + _childActualSize);
                // Force a new measure/arrange pass
                InvalidateMeasure();
            }
            else
            {
                // Clear the "need to measure/arrange again" flag
                _childActualSize = Size.Empty;
            }
            DiagnosticWriteLine("  _layoutRoot.RenderSize = " + _layoutRoot.RenderSize);

            // Return result to perform the transformation
            DiagnosticWriteLine("ArrangeOverride > " + finalSize);
            return finalSize;
        }

        // Compute the largest usable size (i.e., greatest area) after applying the transformation to the specified bounds
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity", Justification = "Closely corresponds to WPF's FrameworkElement.FindMaximalAreaLocalSpaceRect.")]
        private Size ComputeLargestTransformedSize(Size arrangeBounds)
        {
            DiagnosticWriteLine("  ComputeLargestTransformedSize < " + arrangeBounds);

            // Computed largest transformed size
            Size computedSize = Size.Empty;

            // Detect infinite bounds and constrain the scenario
            bool infiniteWidth = double.IsInfinity(arrangeBounds.Width);
            if (infiniteWidth)
            {
                arrangeBounds.Width = arrangeBounds.Height;
            }
            bool infiniteHeight = double.IsInfinity(arrangeBounds.Height);
            if (infiniteHeight)
            {
                arrangeBounds.Height = arrangeBounds.Width;
            }

            // Capture the matrix parameters
            var a = _transformation.M11;
            var b = _transformation.M12;
            var c = _transformation.M21;
            var d = _transformation.M22;

            // Compute maximum possible transformed width/height based on starting width/height
            // These constraints define two lines in the positive x/y quadrant
            var maxWidthFromWidth = Math.Abs(arrangeBounds.Width / a);
            var maxHeightFromWidth = Math.Abs(arrangeBounds.Width / c);
            var maxWidthFromHeight = Math.Abs(arrangeBounds.Height / b);
            var maxHeightFromHeight = Math.Abs(arrangeBounds.Height / d);

            // The transformed width/height that maximize the area under each segment is its midpoint
            // At most one of the two midpoints will satisfy both constraints
            var idealWidthFromWidth = maxWidthFromWidth / 2;
            var idealHeightFromWidth = maxHeightFromWidth / 2;
            var idealWidthFromHeight = maxWidthFromHeight / 2;
            var idealHeightFromHeight = maxHeightFromHeight / 2;

            // Compute slope of both constraint lines
            var slopeFromWidth = -(maxHeightFromWidth / maxWidthFromWidth);
            var slopeFromHeight = -(maxHeightFromHeight / maxWidthFromHeight);

            // Check for empty bounds
            if ((0 == arrangeBounds.Width) || (0 == arrangeBounds.Height))
            {
                computedSize = new Size(0, 0);
            }
            // Check for completely unbound scenario
            else if (infiniteWidth && infiniteHeight)
            {
                computedSize = new Size(double.PositiveInfinity, double.PositiveInfinity);
            }
            // Check for singular matrix
            else if (!MatrixHasInverse(_transformation))
            {
                computedSize = new Size(0, 0);
            }
            // Check for 0/180 degree special cases
            else if ((0 == b) || (0 == c))
            {
                var maxHeight = (infiniteHeight ? double.PositiveInfinity : maxHeightFromHeight);
                var maxWidth = (infiniteWidth ? double.PositiveInfinity : maxWidthFromWidth);
                // No constraints
                if ((0 == b) && (0 == c))
                {
                    computedSize = new Size(maxWidth, maxHeight);
                }
                // Constrained by width
                else if (0 == b)
                {
                    var computedHeight = Math.Min(idealHeightFromWidth, maxHeight);
                    computedSize = new Size(
                        maxWidth - Math.Abs((c * computedHeight) / a),
                        computedHeight);
                }
                // Constrained by height
                else if (0 == c)
                {
                    var computedWidth = Math.Min(idealWidthFromHeight, maxWidth);
                    computedSize = new Size(
                        computedWidth,
                        maxHeight - Math.Abs((b * computedWidth) / d));
                }
            }
            // Check for 90/270 degree special cases
            else if ((0 == a) || (0 == d))
            {
                var maxWidth = (infiniteHeight ? double.PositiveInfinity : maxWidthFromHeight);
                var maxHeight = (infiniteWidth ? double.PositiveInfinity : maxHeightFromWidth);
                // No constraints
                if ((0 == a) && (0 == d))
                {
                    computedSize = new Size(maxWidth, maxHeight);
                }
                // Constrained by width
                else if (0 == a)
                {
                    var computedHeight = Math.Min(idealHeightFromHeight, maxHeight);
                    computedSize = new Size(
                        maxWidth - Math.Abs((d * computedHeight) / b),
                        computedHeight);
                }
                // Constrained by height
                else if (0 == d)
                {
                    var computedWidth = Math.Min(idealWidthFromWidth, maxWidth);
                    computedSize = new Size(
                        computedWidth,
                        maxHeight - Math.Abs((a * computedWidth) / c));
                }
            }
            // Check the width midpoint for viability (by being below the height constraint line)
            else if (idealHeightFromWidth <= ((slopeFromHeight * idealWidthFromWidth) + maxHeightFromHeight))
            {
                computedSize = new Size(idealWidthFromWidth, idealHeightFromWidth);
            }
            // Check the height midpoint for viability (by being below the width constraint line)
            else if (idealHeightFromHeight <= ((slopeFromWidth * idealWidthFromHeight) + maxHeightFromWidth))
            {
                computedSize = new Size(idealWidthFromHeight, idealHeightFromHeight);
            }
            // Neither midpoint is viable; use the intersection of the two constraint lines instead
            else
            {
                // Compute width by setting heights equal (m1*x+c1=m2*x+c2)
                var computedWidth = (maxHeightFromHeight - maxHeightFromWidth) / (slopeFromWidth - slopeFromHeight);
                // Compute height from width constraint line (y=m*x+c; using height would give same result)
                computedSize = new Size(
                    computedWidth,
                    (slopeFromWidth * computedWidth) + maxHeightFromWidth);
            }

            // Return result
            DiagnosticWriteLine("  ComputeLargestTransformedSize > " + computedSize);
            return computedSize;
        }

        // Return true iff Size a is smaller than Size b in either dimension
        private static bool IsSizeSmaller(Size a, Size b)
        {
            // WPF equivalent of following code:
            // return ((a.Width < b.Width) || (a.Height < b.Height));
            return ((a.Width + AcceptableDelta < b.Width) || (a.Height + AcceptableDelta < b.Height));
        }

        // Rounds the non-offset elements of a matrix to avoid issues due to floating point imprecision
        private static Matrix RoundMatrix(Matrix matrix, int decimalsAfterRound)
        {
            return new Matrix(
                Math.Round(matrix.M11, decimalsAfterRound),
                Math.Round(matrix.M12, decimalsAfterRound),
                Math.Round(matrix.M21, decimalsAfterRound),
                Math.Round(matrix.M22, decimalsAfterRound),
                matrix.OffsetX,
                matrix.OffsetY);
        }

        // Implement WPF's Rect.Transform on Silverlight
        private static Rect RectTransform(Rect rect, Matrix matrix)
        {
            // WPF equivalent of following code:
            // var rectTransformed = Rect.Transform(rect, matrix);
            var leftTop = matrix.Transform(new Point(rect.Left, rect.Top));
            var rightTop = matrix.Transform(new Point(rect.Right, rect.Top));
            var leftBottom = matrix.Transform(new Point(rect.Left, rect.Bottom));
            var rightBottom = matrix.Transform(new Point(rect.Right, rect.Bottom));
            var left = Math.Min(Math.Min(leftTop.X, rightTop.X), Math.Min(leftBottom.X, rightBottom.X));
            var top = Math.Min(Math.Min(leftTop.Y, rightTop.Y), Math.Min(leftBottom.Y, rightBottom.Y));
            var right = Math.Max(Math.Max(leftTop.X, rightTop.X), Math.Max(leftBottom.X, rightBottom.X));
            var bottom = Math.Max(Math.Max(leftTop.Y, rightTop.Y), Math.Max(leftBottom.Y, rightBottom.Y));
            var rectTransformed = new Rect(left, top, right - left, bottom - top);
            return rectTransformed;
        }

        // Implement WPF's Matrix.Multiply on Silverlight
        private static Matrix MatrixMultiply(Matrix matrix1, Matrix matrix2)
        {
            // WPF equivalent of following code:
            // return Matrix.Multiply(matrix1, matrix2);
            return new Matrix(
                (matrix1.M11 * matrix2.M11) + (matrix1.M12 * matrix2.M21),
                (matrix1.M11 * matrix2.M12) + (matrix1.M12 * matrix2.M22),
                (matrix1.M21 * matrix2.M11) + (matrix1.M22 * matrix2.M21),
                (matrix1.M21 * matrix2.M12) + (matrix1.M22 * matrix2.M22),
                ((matrix1.OffsetX * matrix2.M11) + (matrix1.OffsetY * matrix2.M21)) + matrix2.OffsetX,
                ((matrix1.OffsetX * matrix2.M12) + (matrix1.OffsetY * matrix2.M22)) + matrix2.OffsetY);
        }

        // Implement WPF's Matrix.HasInverse on Silverlight
        private static bool MatrixHasInverse(Matrix matrix)
        {
            // WPF equivalent of following code:
            // return matrix.HasInverse;
            return (0 != ((matrix.M11 * matrix.M22) - (matrix.M12 * matrix.M21)));
        }

        // Output diagnostic info iff DIAGNOSTICWRITELINE is defined
        [Conditional("DIAGNOSTICWRITELINE")]
        private static void DiagnosticWriteLine(string line)
        {
            Debug.WriteLine(line);
        }
    }
}
