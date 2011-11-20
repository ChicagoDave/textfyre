using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Zifmia.Model
{
    public class ZifmiaState
    {
        public string Username { get; set; }
        public string Nickname { get; set; }
        public string AuthKey { get; set; }
        public string SessionKey { get; set; }
        public int BranchId { get; set; }
        public int Turn { get; set; }
        public ZifmiaLoginViewModel LoginData { get; set; }

        public ZifmiaState(HttpRequestBase request) {
            this.AuthKey = request.Cookies["zifmiaAuthKey"] != null ? request.Cookies["zifmiaAuthKey"].Value : "";
            int branchId = 0;
            if (request.Cookies["zifmiaBranchId"] != null)
                Int32.TryParse(request.Cookies["zifmiaBranchId"].Value, out branchId);
            this.BranchId = branchId;
            this.Nickname = request.Cookies["zifmiaNickname"] != null ? request.Cookies["zifmiaNickname"].Value : "";
            this.SessionKey = request.Cookies["zifmiaSession"] != null ? request.Cookies["zifmiaSession"].Value : "";
            int turn = 0;
            if (request.Cookies["zifmiaTurn"] != null)
                Int32.TryParse(request.Cookies["zifmiaTurn"].Value, out turn);
            this.Turn = turn;
            this.Username = request.Cookies["zifmiaUsername"] != null ? request.Cookies["zifmiaUsername"].Value : "";
            this.LoginData = new ZifmiaLoginViewModel();
        }
    }
}