using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using System.Xml.Linq;
using System.Xml;
using System.Xml.Xsl;
using System.Threading;
using System.Net.Mail;
using System.Net;

namespace SilverFyre.Web
{
	public partial class Transcript : System.Web.UI.Page
	{
		private static XslCompiledTransform transform;

		protected void Page_Load( object sender, EventArgs e )
		{
			transcript.InnerHtml = GetHtml();
		}

		private MemoryStream GetContent()
		{
			var key = Request.QueryString[ "k" ];
			var buffer = Context.Cache[ key ] as byte[];

			return new MemoryStream( buffer );
		}

		private string GetHtml()
		{
			using ( var stream = GetContent() )
			{
				using ( var reader = XmlReader.Create( stream ) )
				{
					var doc = XDocument.Load( reader );

					using ( var writer = new StringWriter() )
					{
						Transform( doc, writer );
						return writer.GetStringBuilder().ToString();
					}
				}
			}
		}

		private void Transform( XDocument doc, TextWriter writer )
		{
			if ( transform == null )
			{
				var xslt = new XslCompiledTransform();
				xslt.Load( Server.MapPath( "~/Transcript.xslt" ) );

				Interlocked.Exchange<XslCompiledTransform>( ref transform, xslt );
			}

			using ( var reader = doc.CreateReader() )
			{
				transform.Transform( reader, null, writer );
			}
		}

		protected void SendEmail( object sender, EventArgs e )
		{
			try
			{
				var recipients = new MailAddressCollection();
				recipients.Add( new MailAddress( email.Text ) );

				var message = new MailMessage(
					new MailAddress( "transcript@SilverFyre.codeplex.com", "SilverFyre Interpreter Transcript" ),
					new MailAddress( email.Text ) )
				{
					Subject = "SilverFyre Transcript",
					Body = GetHtml(),
					IsBodyHtml = true
				};

				using ( var stream = GetContent() )
				{
					message.Attachments.Add( new Attachment( stream, "Transcript.xml", "text/xml" ) );

					throw new ApplicationException( "TODO: SMTP not configured!" );

					var client = new SmtpClient( "65.166.200.181" /* SMTP server address */ );
					client.Credentials = new NetworkCredential( /* Credentials... */ );
					client.Send( message );
				}

				sendResult.InnerHtml = string.Format( "Transcript sent to <b>{0}</b>", email.Text );
			}
			catch
			{
				sendResult.InnerHtml = string.Format( "Failed to send email to <b>{0}</b>", email.Text );
			}
		}
	}
}