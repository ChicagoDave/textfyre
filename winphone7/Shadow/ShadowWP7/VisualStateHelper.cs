using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ShadowWP7
{
	public static class VisualStateHelper
	{
		public static bool Activate( this VisualState state, Control control, bool useTransitions = true )
		{
			return VisualStateManager.GoToState( control, state.Name, useTransitions );
		}

		public static bool Activate( this VisualState state, Control control )
		{
			return state.Activate( control, true );
		}
	}
}