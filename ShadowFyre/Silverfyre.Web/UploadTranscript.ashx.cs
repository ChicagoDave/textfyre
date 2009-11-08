using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.SessionState;
using System.Xml.Linq;
using System.Xml;
using System.Web.Caching;

namespace SilverFyre.Web
{
	/// <summary>
	/// Summary description for $codebehindclassname$
	/// </summary>
	[WebService( Namespace = "http://www.chriscavanagh.com/SilverFyre/Transcript/" )]
	[WebServiceBinding( ConformsTo = WsiProfiles.BasicProfile1_1 )]
	public class UploadTranscript : IHttpHandler, IRequiresSessionState
	{
		public void ProcessRequest( HttpContext context )
		{
			var key = Guid.NewGuid().ToString( "N" );

			context.Cache.Add(
				key,
				context.Request.BinaryRead( Math.Min( 1024 * 512, context.Request.TotalBytes ) ),
				null,
				Cache.NoAbsoluteExpiration,
				TimeSpan.FromDays( 5 ),
				CacheItemPriority.Default,
				null );

			context.Response.ContentType = "text/plain";
			context.Response.Write( key );
		}

		public bool IsReusable
		{
			get
			{
				return true;
			}
		}
	}
}
