//
// Zifmia.js - Copyright © 2011 - David Cornelson
//
// This file should not need to be modified.
//

//
// Support cross domain requests. This is required for IE and jQuery 1.6.
//
//$.support.cors = true;

var zifmia = new Zifmia();

function Zifmia() {

    //
    // Zifmia Service Layer - Each call is a routed REST call that returns JSON.
    //
    var ZifmiaRegister          = "Register/{0}/{1}/{2}/{3}";               // username, password, nickName, emailAddress
    var ZifmiaLogin             = "Login/{0}/{1}";                          // username, password
    var ZifmiaAuthorized        = "IsAuthorized/{0}";                       // authKey
    var ZifmiaGames             = "Games";                                  // no arguments
    var ZifmiaSessionStart      = "SessionStart/{0}/{1}";                  // authKey, gameKey
    var ZifmiaSessionCommand    = "SessionCommand/{0}/{1}/{2}/{3}/{4}";    // authKey, sessionKey, branchid, turn, command
    var ZifmiaSessionGet        = "SessionGet/{0}/{1}";                    // authKey, sessionKey
    var ZifmiaSessionGetHistory = "SessionHistory/{0}/{1}/{2}/{3}";        // authKey, sessionKey, branchId, turn
    var ZifmiaUserSessionList   = "UserSessionList/{0}";                  // authKey

    var isSessionDataLoaded = false;

    this.ShadowInTheCathedral = "AAAAAAA";
    this.JackToresalAndTheSecretLetter = "AAAAAAB";
    this.CloakOfDarkness = "AAAAAAA";

    this.ZC_USERNAME = "zifmiaUsername";
    this.ZC_NICKNAME = "zifmiaNickname";
    this.ZC_AUTHKEY = "zifmiaAuthKey";

    this.username = "";
    this.nickname = "";
    this.authKey = "";

    this.loadSessionData = function () {
        this.username = getCookie(this.ZC_USERNAME, "");
        this.nickname = getCookie(this.ZC_NICKNAME, "");
        this.authKey = getCookie(this.ZC_AUTHKEY, "");

        isSessionDataLoaded = true;
    }

    this.saveSessionData = function () {
        setCookie(this.ZC_USERNAME, this.username, 7);
        setCookie(this.ZC_NICKNAME, this.nickname, 7);
        setCookie(this.ZC_AUTHKEY, this.authKey, 7);
    }

    this.eraseSessionData = function () {
        setCookie(this.ZC_USERNAME, "");
        setCookie(this.ZC_NICKNAME, "");
        setCookie(this.ZC_AUTHKEY, "");
    }

    this.knownUser = function () {
        if (isSessionDataLoaded == false) {
            this.loadSessionData();
        }

        if (this.username != null && this.username != "" && this.username.length > 0) {
            return true;
        }

        return false;
    }

    this.authorized = function () {

        if (this.authKey == null || this.authKey == "") {
            return false;
        }

        var zifmiaLoginModel = this.checkAuthorization(this.authKey);

        if (zifmiaLoginModel != null) {
            return true;
        }

        return false;
    }

    this.loginGuest = function () {

        this.login("guest", "guest", handleGuestLogin, handleGuestError);

    }

    // AuthKey, Nickname, Status (Success=0,Failure=-1,Unauthorized=-2,Invalid=-3,DoesNotExist=-4), Message
    function handleGuestLogin(viewModel) {
        if (viewModel.Status == 0) {
            zifmia.authKey = viewModel.AuthKey;
            zifmia.nickname = viewModel.Nickname;
            zifmia.saveSessionData(); // Let's stay logged in by setting our cookies.
        }
    }

    function handleGuestError(xhr, textStatus, errorThrown) {
        $("#mainContent").html(xhr.responseText);
        $("#mainPanel").show();
    }
        
    this.getTemplate = function (templateURI) {
        return $.ajax({
            url: templateURI,
            global: false,
            type: "GET",
            async: false
        }).responseText;
    }

    this.register = function (ajaxImage, username, password, nickName, emailAddress, callback, errorCallback) {
        var sendURL = ZifmiaRegister.format(escape(username), escape(password), escape(nickName), escape(emailAddress));
        $.ajax({
            type: "GET",
            url: sendURL,
            dataType: "json",
            success: function (zifmiaRegistrationViewModel) {
                callback(zifmiaRegistrationViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            },
            beforeSend: function () { $(ajaxImage).show(); },
            complete: function () { $(ajaxImage).hide(); }
        });
    }

    this.login = function (username, password, callback, errorCallback) {
        $.ajax({
            type: "GET",
            url: ZifmiaLogin.format(username, password),
            dataType: "json",
            async: false,
            success: function (zifmiaLoginViewModel) {
                callback(zifmiaLoginViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            }
        });
    }

    this.checkAuthorization = function (authKey) {
        return $.ajax({
            type: "GET",
            url: ZifmiaAuthorized.format(authKey),
            dataType: "json",
            async: false
        }).responseText;
    }

    this.listGames = function (callback, errorCallback) {
        $.ajax({
            type: "GET",
            url: ZifmiaGames,
            dataType: "json",
            success: function (zifmiaGamesViewModel) {
                callback(zifmiaGamesViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            },
            beforeSend: function () { $(ajaxLoading).show(); },
            complete: function () { $(ajaxLoading).hide(); }
        });
    }

    this.startSession = function (gameKey, callback, errorCallback) {
        $.ajax({
            type: "GET",
            url: ZifmiaSessionStart.format(zifmia.authKey, gameKey),
            dataType: "json",
            success: function (zifmiaViewModel) {
                callback(zifmiaViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            },
            beforeSend: function () { $(ajaxLoading).show(); },
            complete: function () { $(ajaxLoading).hide(); }
        });
    }

    // Note that if the client sends in a command from a history turn (less than the greatest turn number for this session)
    // a new session will be created and returned with the response. This means the client should always be aware of the
    // returned sessionKey.
    this.sendCommand = function (sessionKey, branchid, turn, command, callback, errorCallback) {
        $.ajax({
            type: "GET",
            url: ZifmiaSessionCommand.format(zifmia.authKey, sessionKey, branchid, turn, command),
            dataType: "json",
            success: function (zifmiaViewModel) {
                callback(zifmiaViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            },
            beforeSend: function () { $(ajaxLoading).show(); },
            complete: function () { $(ajaxLoading).hide(); }
        });
    }

    //
    // Get the last turn session and response data of a given session.
    //
    this.getSession = function (sessionKey, callback, errorCallback) {
        $.ajax({
            type: "GET",
            url: ZifmiaSessionGet.format(zifmia.authKey, sessionKey),
            dataType: "json",
            success: function (zifmiaViewModel) {
                callback(zifmiaViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            },
            beforeSend: function () { $(ajaxLoading).show(); },
            complete: function () { $(ajaxLoading).hide(); }
        });
    }

    //
    // Get the history turn.
    //
    this.getHistorySession = function (sessionKey, branchId, turn, callback, errorCallback) {
        $.ajax({
            type: "GET",
            url: ZifmiaSessionGetHistory.format(zifmia.authKey, sessionKey, branchId, turn),
            dataType: "json",
            success: function (zifmiaViewModel) {
                callback(zifmiaViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            },
            beforeSend: function () { $(ajaxLoading).show(); },
            complete: function () { $(ajaxLoading).hide(); }
        });
    }

    this.getUserSessions = function (callback, errorCallback) {
        $.ajax({
            type: "GET",
            url: ZifmiaUserSessionList.format(zifmia.authKey),
            dataType: "json",
            success: function (zifmiaSessionsViewModel) {
                callback(zifmiaSessionsViewModel);
            },
            error: function (xhr, textStatus, errorThrown) {
                errorCallback(xhr, textStatus, errorThrown);
            },
            beforeSend: function () { $(ajaxLoading).show(); },
            complete: function () { $(ajaxLoading).hide(); }
        });
    }

}
