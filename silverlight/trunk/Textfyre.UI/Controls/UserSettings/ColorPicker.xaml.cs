using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace Textfyre.UI.Controls.UserSettings
{
    public partial class ColorPicker : UserControl
    {
        ColorSpace m_colorSpace;
        bool m_sliderMouseDown;
        // bool m_isMouseCaptured;
        bool m_sampleMouseDown;
        float m_selectedHue;
        int m_sampleX;
        int m_sampleY;
        private Color m_selectedColor;
        public delegate void ColorSelectedHandler(Color c);
        //public event ColorSelectedHandler ColorSelected;

        public ColorPicker()
        {
            InitializeComponent();
            rectHueMonitor.MouseLeftButtonDown += new MouseButtonEventHandler(rectHueMonitor_MouseLeftButtonDown);
            rectHueMonitor.MouseLeftButtonUp += new MouseButtonEventHandler(rectHueMonitor_MouseLeftButtonUp);
            rectHueMonitor.MouseMove += new MouseEventHandler(rectHueMonitor_MouseMove);

            rectHueMonitor.Cursor = Cursors.Hand;

            rectSampleMonitor.MouseLeftButtonDown += new MouseButtonEventHandler(rectSampleMonitor_MouseLeftButtonDown);
            rectSampleMonitor.MouseLeftButtonUp += new MouseButtonEventHandler(rectSampleMonitor_MouseLeftButtonUp);
            rectSampleMonitor.MouseMove += new MouseEventHandler(rectSampleMonitor_MouseMove);

            rectSampleMonitor.Cursor = Cursors.Hand;

            SliderOpacity.ValueChanged += new RoutedPropertyChangedEventHandler<double>(SliderOpacity_ValueChanged);

            m_colorSpace = new ColorSpace();
            m_selectedHue = 0;
            m_sampleX = (int)rectSampleMonitor.Width;
            m_sampleY = 0;
            UpdateSample(m_sampleX, m_sampleY);
        }

        void rectHueMonitor_MouseLeftButtonDown(object sender, MouseEventArgs e)
        {
            m_sliderMouseDown = rectHueMonitor.CaptureMouse();
            int yPos = (int)e.GetPosition((UIElement)sender).Y;
            UpdateSelection(yPos);
            
        }

        void rectHueMonitor_MouseLeftButtonUp(object sender, MouseEventArgs e)
        {
            m_sliderMouseDown = false;
            rectHueMonitor.ReleaseMouseCapture();
        }

        void rectHueMonitor_MouseMove(object sender, MouseEventArgs e)
        {
            if (m_sliderMouseDown)
            {
                int yPos = (int)e.GetPosition((UIElement)sender).Y;

                yPos = Math.Max(0, yPos);
                yPos = Math.Min(180, yPos);                
                UpdateSelection(yPos);
                
            }
        }

        void rectSampleMonitor_MouseLeftButtonDown(object sender, MouseEventArgs e)
        {
            m_sampleMouseDown = rectSampleMonitor.CaptureMouse();
            Point pos = e.GetPosition((UIElement)sender);
            m_sampleX = (int)pos.X;
            m_sampleY = (int)pos.Y;
            UpdateSample(m_sampleX, m_sampleY);
        }

        void rectSampleMonitor_MouseLeftButtonUp(object sender, MouseEventArgs e)
        {
            rectSampleMonitor.ReleaseMouseCapture();
            m_sampleMouseDown = false;
        }

        void rectSampleMonitor_MouseMove(object sender, MouseEventArgs e)
        {
            if (m_sampleMouseDown)
            {
                Point pos = e.GetPosition((UIElement)sender);

                int x = (int)pos.X;
                int y = (int)pos.Y;

                y = Math.Max(0, y);
                y = Math.Min(180, y);
                x = Math.Max(0, x);
                x = Math.Min(180, x);                

                m_sampleX = x;
                m_sampleY = y;
                UpdateSample(m_sampleX, m_sampleY);
            }
        }

        private void UpdateSample(int xPos, int yPos)
        {

            SampleSelector.SetValue(Canvas.LeftProperty, xPos - (SampleSelector.Height / 2));
            SampleSelector.SetValue(Canvas.TopProperty, yPos - (SampleSelector.Height / 2));

            float yComponent = 1 - (float)(yPos / rectSample.Height);
            float xComponent = (float)(xPos / rectSample.Width);

            m_selectedColor = m_colorSpace.ConvertHsvToRgb((float)m_selectedHue, xComponent, yComponent);
            m_selectedColor.A = (byte)SliderOpacity.Value;
            SelectedColor.Fill = new SolidColorBrush(m_selectedColor);
            HexValue.Text = m_colorSpace.GetHexCode(m_selectedColor);
        }



        private void UpdateSelection(int yPos)
        {
            int huePos = (int)(yPos / rectHueMonitor.Height * 255);
            int gradientStops = 6;
            Color c = m_colorSpace.GetColorFromPosition(huePos * gradientStops, (int)SliderOpacity.Value);
            rectSample.Fill = new SolidColorBrush(c);
            HueSelector.SetValue(Canvas.TopProperty, yPos - (HueSelector.Height / 2));
            m_selectedHue = (float)(yPos / rectHueMonitor.Height) * 360;
            UpdateSample(m_sampleX, m_sampleY);
        }

        void SliderOpacity_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            UpdateSample(m_sampleX, m_sampleY);
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Visibility = Visibility.Collapsed;
        }

        private void BtnOK_Click(object sender, RoutedEventArgs e)
        {
            //if (ColorSelected != null)
            //{
            //    ColorSelected(m_selectedColor);
            //}
            if (_colorPickerBtn != null)
            {
                _colorPickerBtn.SelectedBrush = new SolidColorBrush(m_selectedColor);
            }
            this.Visibility = Visibility.Collapsed;
        }

        private ColorPickerButton _colorPickerBtn;
        public void Show( ColorPickerButton colorPickerBtn )
        {
            _colorPickerBtn = colorPickerBtn;
            m_selectedColor = (_colorPickerBtn.SelectedBrush as SolidColorBrush).Color;
            SelectedColor.Fill = new SolidColorBrush(m_selectedColor);
            HexValue.Text = m_colorSpace.GetHexCode(m_selectedColor);
            this.Visibility = Visibility.Visible;
        }

    }
}
