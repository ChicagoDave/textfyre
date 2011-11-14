<script type="text/javascript">

    var cloak = new Game();

    $(document).ready(function () {

        zifmia.loadSessionData();

        if (zifmia.authorized()) {
            $("#nicknameLabel").text(zifmia.nickname);
        } else {
            zifmia.loginGuest();
            $("#nicknameLabel").text("(guest)");
        }

        // We're authorized...load the game.

        cloak.setGame('cloak');

        $("#mapButton").click(function () {
            $("#gameMap").bPopup();
        });

        $("#hintsButton").click(function () {
            $("#hintsBlock").bPopup();
        });

        $('html, body').animate({ scrollTop: '0px' }, 800);

        if (cloak.sessionKey == null || cloak.sessionKey == "") {
            //
            // Start a session
            //

            zifmia.startSession(zifmia.CloakOfDarkness, handleStartSession, handleStartSessionError);

        } else {
            //
            // Get known session
            //

            zifmia.getSession(cloak.sessionKey, handleGetSession, handleGetSessionError);
        }

        $("#logoutButton").click(function () {
            zifmia.authKey = "";
            zifmia.saveSessionData();
            document.location.href = "/index.html";
        });

    });

    function handleStartSession(viewModel) {

        if (viewModel.Status != 0) {
            alert(viewModel.Message);
            location.href = "/index.html";
        }

        // store the session key in a cookie
        cloak.setSessionKey(viewModel.SessionKey);

        // Loads channel content
        cloak.loadChannelData(viewModel.Channels);
        cloak.setBranchId(viewModel.BranchId);
        cloak.setTurn(viewModel.Turn);

        if (cloak.prologueChannel != "") {


        }

        if (cloak.prologueChannel != "") {
            $("#prologueContent").html(cloak.prologueChannel.toHtml());
            $("#prologuePanel").show();
            setupPrologue();
        }

        $("#mainContent").html(cloak.mainChannel.toHtml());
        $("#promptTitle").text(cloak.promptChannel);
        $("#locationTitle").html(cloak.locationChannel);
        $("#gameTitleLabel").html(cloak.titleChannel);

    }

    function handleStartSessionError(xhr, textStatus, errorThrown) {
        $("#mainContent").html(xhr.responseText);
        $("#mainPanel").show();
    }

    function handleGetSession(viewModel) {
        if (viewModel.Status != 0) {
            alert(viewModel.Message);
            location.href = "/index.html";
        }

        // Loads channel content
        cloak.loadChannelData(viewModel.Channels);
        cloak.setBranchId(viewModel.BranchId);
        cloak.setTurn(viewModel.Turn);

        $("#mainContent").html(cloak.mainChannel.toHtml());
        $("#promptTitle").text(cloak.promptChannel);
        $("#locationTitle").html(cloak.locationChannel);
        $("#gameTitleLabel").html(cloak.titleChannel);

        $("#mainPanel").show();
        $("#footerWrap").slideToggle(function () { });

        $("#userCommand").keypress(onCommandEnter).focus();
    }

    function handleGetSessionError(xhr, textStatus, errorThrown) {
    }

    function handleSendCommand(viewModel) {
        if (viewModel.Status != 0) {
            alert(viewModel.Message);
            location.href = "/index.html";
        }

        // Loads channel content
        cloak.loadChannelData(viewModel.Channels);

        // Save current branch and turn
        cloak.setBranchId(viewModel.BranchId);
        cloak.setTurn(viewModel.Turn);

        // Display channel content
        $("#mainContent").html(cloak.mainChannel.toHtml());
        $("#promptTitle").text(cloak.promptChannel);
        $("#locationTitle").html(cloak.locationChannel);
        $("#gameTitleLabel").html(cloak.titleChannel);

        $("#userCommand").focus();
    }

    function handleSendCommandError() {
    }

    function onCommandEnter(e) {
        if (e.which == 13) {
            handleCommand();
        }
    }

    function setupPrologue() {
        $("#prologueButton").click(function () {

            $("#prologuePanel").hide();
            $("#mainPanel").show();
            $("#footerWrap").slideToggle(function () { });
            $("#userCommand").keypress(onCommandEnter(e));
        });
    }

    function handleCommand() {
        var command = $("#userCommand").val();

        zifmia.sendCommand(cloak.sessionKey, cloak.branchId, cloak.turn, command, handleSendCommand, handleSendCommandError);

        $("#userCommand").val("");
    }

    function setupPrologue() {
        $('#anyKey').keydown(function () {
            $('#page').unbind('keydown');
            showMain();
        });
    }

    function setupAnykey() {
        $("#anyKey").focus();
    }

    function showMain() {
        $("#prologuePanel").hide();
        $("#mainPanel").show();
        $("#prologueButton").hide();
        $("#commandPanel").slideToggle(function () { });
        $("#userCommand").keypress(onCommandEnter);
        $("#userCommand").val("");
        $("#userCommand").focus();
        $('html, body').animate({ scrollTop: '0px' }, 800);
        $("#contentTitle").text("Current Location");
        $("#mapButton").show();
        $("#hintsButton").show();
    }

    function onCommandEnter(e) {
        if (e.which == 13) {
            handleCommand();
        }
    }

    function handleCommand() {
        var command = $("#userCommand").val();

        zifmia.sendCommand(cloak.sessionKey, cloak.branchId, cloak.turn, command, handleSendCommand, handleSendCommandError);

        $("#userCommand").val("");
    }

    var skipToggle = 0;

    function toggleQuestion(answers) {

        var a = document.getElementById(answers.id);

        if (skipToggle == 0) {
            if (a.style.display == 'none') {
                a.style.display = 'block';
            } else {
                a.style.display = 'none';
            }
        }

        skipToggle = 0;
    }

    function showHint(mungedText, hintText) {
        mungedText.style.display = 'none';
        hintText.style.display = 'block';
        skipToggle = 1;
    }
</script>
