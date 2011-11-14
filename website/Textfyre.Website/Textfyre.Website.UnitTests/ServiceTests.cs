using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Microsoft.VisualStudio.TestTools.UnitTesting;

using Textfyre.Website.Controllers;
using Zifmia.Model;
using Zifmia.Service.Controller;

namespace Textfyre.Website.UnitTests
{
    /// <summary>
    /// Summary description for ServiceTests
    /// </summary>
    [TestClass]
    public class ServiceTests
    {
        public ServiceTests()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [TestMethod]
        public void InvalidLoginTest()
        {
            ServiceController controller = new ServiceController();
            JsonResult result = controller.Login("testuser99", "password");

            Assert.IsTrue(result.Data != null, "Results cannot be null.");

            ZifmiaLoginViewModel viewModel = (ZifmiaLoginViewModel)result.Data;

            Assert.IsTrue(viewModel.Status == ZifmiaStatus.DoesNotExist, "'testuser/password' should result in DoesNotExist status.");
            Assert.IsTrue(viewModel.Message == "You are not authorized. Please log in again.", "Message should be 'You are not authorized. Please log in again.'.");
        }

        [TestMethod]
        public void RegisterTest()
        {
            ServiceController controller = new ServiceController();
            JsonResult result = controller.Register("testuser2", "password", "TestUser2", "testuser2@textfyre.com");

            Assert.IsNotNull(result, "Results cannot be null.");

            ZifmiaRegistrationViewModel viewData = (ZifmiaRegistrationViewModel)result.Data;
            
            ZifmiaController zController = new ZifmiaController(false);
            ZifmiaPlayer player = zController.Database.GetPlayerByUsername("testuser2");

            Assert.IsNotNull(player, "Player was not registered successfully.");
            Assert.IsTrue(player.Username == "testuser2", "Username is incorrect.");

            ZifmiaStatus zStatus = zController.AuthorizePlayer(player.ValidationId);

            Assert.IsTrue(zStatus == ZifmiaStatus.Success, "Authorization should succeed.");
        }

        [TestMethod]
        public void ValidLoginTest()
        {
            ServiceController controller = new ServiceController();
            JsonResult result = controller.Login("testuser1", "password");

            Assert.IsTrue(result.Data != null, "Results cannot be null.");

            ZifmiaLoginViewModel viewModel = (ZifmiaLoginViewModel)result.Data;
        }

        [TestInitialize]
        public void RemoveOldData()
        {
            ZifmiaController zController = new ZifmiaController(false);
            zController.DeletePlayer("testuser1");
            zController.DeletePlayer("testuser2");
        }

    }
}
