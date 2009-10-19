using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Xml.Linq;
using System.Web.Services;

namespace SilverFyre.Web
{
	/// <summary>
	/// Summary description for $codebehindclassname$
	/// </summary>
	[WebService( Namespace = "http://www.chriscavanagh.com/SilverFyre/Transcript/" )]
	[WebServiceBinding( ConformsTo = WsiProfiles.BasicProfile1_1 )]
	public class TranscriptXml : IHttpHandler, IRequiresSessionState
	{
		public void ProcessRequest( HttpContext context )
		{
			var key = context.Request.QueryString[ "k" ];
			var buffer = context.Cache[ key ] as byte[];

			if ( buffer != null )
			{
				context.Response.ContentType = "text/xml";
				context.Response.OutputStream.Write( buffer, 0, buffer.Length );
			}
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}
