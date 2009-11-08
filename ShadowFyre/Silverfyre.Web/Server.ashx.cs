using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Net;

namespace SilverFyre.Web
{
	/// <summary>
	/// Summary description for $codebehindclassname$
	/// </summary>
	[WebService( Namespace = "http://www.chriscavanagh.com/StoryServer/" )]
	[WebServiceBinding( ConformsTo = WsiProfiles.BasicProfile1_1 )]
	public class Server : IHttpHandler
	{
		public void ProcessRequest( HttpContext context )
		{
			var url = context.Request.QueryString[ "u" ];
			var request = HttpWebRequest.Create( new Uri( url, UriKind.Absolute ) );
			var response = request.GetResponse();

			using ( var input = response.GetResponseStream() )
			{
				context.Response.ContentType = response.ContentType;
				context.Response.AddHeader( "Content-Length", response.ContentLength.ToString() );

				var buffer = new byte[ 10 * 1024 ];
				int count;

				while ( ( count = input.Read( buffer, 0, buffer.Length ) ) > 0 )
				{
					context.Response.OutputStream.Write( buffer, 0, count );
				}
			}

			context.Response.End();
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
