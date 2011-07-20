Version 1/101123 of FyreVM Support without Output Filtering (for Glulx only) by Textfyre begins here.

Use authorial modesty.

Chapter 1 - FyreVM-specific constants and definitions

[FyreVM defines a new opcode to handle the things that would otherwise be handled by @glk. These definitions allow us to use that opcode.]

Include (-
! FY_READLINE: Takes a buffer address and size and reads a line of input
! from the player. The line length is written into the word at the start
! of the buffer, and the characters are written after (starting at offset 4).
! Writes a length of 0 if the read failed.
Constant FY_READLINE = 1;
! FY_TOLOWER/FY_TOUPPER: Converts a character to lower or upper case, based
! on whichever encoding is used for the dictionary and input buffer.
Constant FY_TOLOWER = 2;
Constant FY_TOUPPER = 3;
! FY_CHANNEL: Selects an output channel.
Constant FY_CHANNEL = 4;
! FY_READKEY: Reads a single character of input, e.g. for pausing the game.
! Returns the Unicode character, or 0 if the read failed.
Constant FY_READKEY = 5;
! FY_SETVENEER: Registers a routine address or constant value with the
! interpreter's veneer acceleration system.
Constant FY_SETVENEER = 6;
! FY_TRANSITION_REQUESTED: Occurs when the game is jumping forward. Helps the UI identify how to do this.
Constant FY_REQUEST_TRANSITION = 7;

! **** Channel IO Layout ****
!
! Each channel constant is a 4 byte integer packed with 4 upper case letters.
!
! Required Channels for FY_CHANNEL.
!
Constant FYC_MAIN = ('M' * $1000000) + ('A' * $10000) + ('I' * $100) + 'N';			! MAIN
Constant FYC_PROMPT = ('P' * $1000000) + ('R' * $10000) + ('P' * $100) + 'T';			! PRPT
Constant FYC_LOCATION = ('L' * $1000000) + ('O' * $10000) + ('C' * $100) + 'N';		! LOCN
Constant FYC_SCORE = ('S' * $1000000) + ('C' * $10000) + ('O' * $100) + 'R';			! SCOR
Constant FYC_TIME = ('T' * $1000000) + ('I' * $10000) + ('M' * $100) + 'E';				! TIME
Constant FYC_DEATH = ('D' * $1000000) + ('E' * $10000) + ('A' * $100) + 'D';			! DEAD

! Game specific channels for FY_CHANNEL
Constant FYC_TITLE = ('T' * $1000000) + ('I' * $10000) + ('T' * $100) + 'L';				! TITL
Constant FYC_CREDITS = ('C' * $1000000) + ('R' * $10000) + ('E' * $100) + 'D';			! CRED
Constant FYC_PROLOGUE = ('P' * $1000000) + ('L' * $10000) + ('O' * $100) + 'G';		! PLOG
Constant FYC_TURN = ('T' * $1000000) + ('U' * $10000) + ('R' * $100) + 'N';			! TURN
Constant FYC_HINT = ('H' * $1000000) + ('I' * $10000) + ('N' * $100) + 'T';				! HINT
Constant FYC_HELP = ('H' * $1000000) + ('E' * $10000) + ('L' * $100) + 'P';				! HELP
Constant FYC_MAP = ('M' * $1000000) + ('A' * $10000) + ('P' * $100) + ' ';				! MAP
Constant FYC_SOUND = ('S' * $1000000) + ('O' * $10000) + ('N' * $100) + 'D';			! SOND
Constant FYC_CHAPTER = ('C' * $1000000) + ('H' * $10000) + ('A' * $100) + 'P';		! CHAP
Constant FYC_ACHIEVEMENT = ('A' * $1000000) + ('C' * $10000) + ('H' * $100) + 'V';	! ACHV
Constant FYC_TIPS = ('T' * $1000000) + ('I' * $10000) + ('P' * $100) + 'S';				! TIPS
Constant FYC_VERSION = ('V' * $1000000) + ('R' * $10000) + ('S' * $100) + 'N';			! VRSN
Constant FYC_VERB = ('V' * $1000000) + ('E' * $10000) + ('R' * $100) + 'B';				! VERB

! Slots for FY_SETVENEER.
Constant FYV_Z__Region = 1;
Constant FYV_CP__Tab = 2;
Constant FYV_OC__Cl = 3;
Constant FYV_RA__Pr = 4;
Constant FYV_RT__ChLDW = 5;
Constant FYV_Unsigned__Compare = 6;
Constant FYV_RL__Pr = 7;
Constant FYV_RV__Pr = 8;
Constant FYV_OP__Pr = 9;
Constant FYV_RT__ChSTW = 10;
Constant FYV_RT__ChLDB = 11;
Constant FYV_Meta__class = 12;

Constant FYV_String = 1001;
Constant FYV_Routine = 1002;
Constant FYV_Class = 1003;
Constant FYV_Object = 1004;
Constant FYV_RT__Err = 1005;
Constant FYV_NUM_ATTR_BYTES = 1006;
Constant FYV_classes_table = 1007;
Constant FYV_INDIV_PROP_START = 1008;
Constant FYV_cpv__start = 1009;
Constant FYV_ofclass_err = 1010;
Constant FYV_readprop_err = 1011;

[ FyreCall a b c res; @"S4:4096" a b c res; return res; ];
-).

[These activate FyreVM's veneer optimizations.]

Include (-
[ REGISTER_VENEER_R;
    @gestalt 4 20 is_fyrevm; ! Test if this interpreter has FyreVM channels
    if (~~is_fyrevm) rfalse;
    
    FyreCall(FY_SETVENEER, FYV_Z__Region, Z__Region);
    FyreCall(FY_SETVENEER, FYV_CP__Tab, CP__Tab);
    FyreCall(FY_SETVENEER, FYV_OC__Cl, OC__Cl);
    FyreCall(FY_SETVENEER, FYV_RA__Pr, RA__Pr);
    FyreCall(FY_SETVENEER, FYV_Unsigned__Compare, Unsigned__Compare);
    FyreCall(FY_SETVENEER, FYV_RL__Pr, RL__Pr);
    FyreCall(FY_SETVENEER, FYV_RV__Pr, RV__Pr);
    FyreCall(FY_SETVENEER, FYV_OP__Pr, OP__Pr);
    FyreCall(FY_SETVENEER, FYV_Meta__class, Meta__class);

#ifdef STRICT_MODE;
    FyreCall(FY_SETVENEER, FYV_RT__ChLDW, RT__ChLDW);
    FyreCall(FY_SETVENEER, FYV_RT__ChSTW, RT__ChSTW);
    FyreCall(FY_SETVENEER, FYV_RT__ChLDB, RT__ChLDB);
#endif;

    FyreCall(FY_SETVENEER, FYV_String, String);
    FyreCall(FY_SETVENEER, FYV_Routine, Routine);
    FyreCall(FY_SETVENEER, FYV_Class, Class);
    FyreCall(FY_SETVENEER, FYV_Object, Object);
    FyreCall(FY_SETVENEER, FYV_RT__Err, RT__Err);
    FyreCall(FY_SETVENEER, FYV_NUM_ATTR_BYTES, NUM_ATTR_BYTES);
    FyreCall(FY_SETVENEER, FYV_classes_table, #classes_table);
    FyreCall(FY_SETVENEER, FYV_INDIV_PROP_START, INDIV_PROP_START);
    FyreCall(FY_SETVENEER, FYV_cpv__start, #cpv__start);
    FyreCall(FY_SETVENEER, FYV_ofclass_err, "apply 'ofclass' for");
    FyreCall(FY_SETVENEER, FYV_readprop_Err, "read");
];
-).

The register veneer routines rule translates into I6 as "REGISTER_VENEER_R".

To decide whether FyreVM is present: (- (is_fyrevm) -). [This global variable is defined below, before VM_Initialise.]
To decide whether FyreVM is not present: (- (~~is_fyrevm) -).

After starting the virtual machine: follow the register veneer routines rule.

[And these set up an alternative way to print text into an array, since Inform's default way of doing that requires Glk.]

Include (-
Global output_buffer_address;
Global output_buffer_size;
Global output_buffer_pos;
Global output_buffer_uni;

Constant MAX_OUTPUT_NESTING = 32;
Array output_buffer_stack --> (MAX_OUTPUT_NESTING * 4);
Global output_buffer_sp = 0;

[ OpenOutputBufferUnicode buffer size;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_address;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_size;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_pos;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_uni;

    output_buffer_address = buffer;
    output_buffer_size = size;
    output_buffer_pos = 0;
    output_buffer_uni = 1;
    @setiosys 1 _OutputBufferProcUni;
];

[ OpenOutputBuffer buffer size;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_address;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_size;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_pos;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_uni;

    output_buffer_address = buffer;
    output_buffer_size = size;
    output_buffer_pos = 0;
    output_buffer_uni = 0;
    @setiosys 1 _OutputBufferProc;
];

[ CloseOutputBuffer results  rv;
    if (results) {
        results-->0 = 0;
        results-->1 = output_buffer_pos;
    }
    rv = output_buffer_pos;
    ResumeOutputBuffer();
    return rv;
];

[ SuspendOutputBuffer;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_address;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_size;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_pos;
    output_buffer_stack-->(output_buffer_sp++) = output_buffer_uni;

    @setiosys 20 0;
];

[ ResumeOutputBuffer;
    output_buffer_uni = output_buffer_stack-->(--output_buffer_sp);
    output_buffer_pos = output_buffer_stack-->(--output_buffer_sp);
    output_buffer_size = output_buffer_stack-->(--output_buffer_sp);
    output_buffer_address = output_buffer_stack-->(--output_buffer_sp);

    if (output_buffer_sp > 0) {
        if (output_buffer_uni)
            @setiosys 1 _OutputBufferProcUni;
        else
            @setiosys 1 _OutputBufferProc;
    } else
        @setiosys 20 0;
];
[ _OutputBufferProcUni ch;
    if (output_buffer_pos < output_buffer_size)
        output_buffer_address-->output_buffer_pos = ch;
    output_buffer_pos++;
];

[ _OutputBufferProc ch;
    if (output_buffer_pos < output_buffer_size)
        output_buffer_address->output_buffer_pos = ch;
    output_buffer_pos++;
];
-).

Chapter 2 - Template replacements

Section 1 - Glulx segment

Include (-
Global is_fyrevm = 0;

[ VM_PreInitialise res;
    @gestalt 4 20 is_fyrevm; ! Test if this interpreter has FyreVM channels
    if (is_fyrevm) {
        ! If so, we can skip all the Glk business
        unicode_gestalt_ok = true;
        @setiosys 20 0;
        return;
    }

];

[ VM_Initialise res;
    @gestalt 4 20 is_fyrevm; ! Test if this interpreter has FyreVM channels
    if (is_fyrevm) {
        ! If so, we can skip all the Glk business
        unicode_gestalt_ok = true;
        @setiosys 20 0;
        return;
    }

    @gestalt 4 2 res; ! Test if this interpreter has Glk...
    if (res == 0) quit; ! ...without which there would be nothing we could do

	unicode_gestalt_ok = false;
	if (glk_gestalt(gestalt_Unicode, 0))
		unicode_gestalt_ok = true;

    ! Set the VM's I/O system to be Glk.
    @setiosys 2 0;

    ! First, we must go through all the Glk objects that exist, and see
    ! if we created any of them. One might think this strange, since the
    ! program has just started running, but remember that the player might
    ! have just typed "restart".

    GGRecoverObjects();

    res = InitGlkWindow(0);
    if (res ~= 0) return;

    ! Now, gg_mainwin and gg_storywin might already be set. If not, set them.

    if (gg_mainwin == 0) {
        ! Open the story window.
        res = InitGlkWindow(GG_MAINWIN_ROCK);
        if (res == 0) {
			glk_stylehint_set(3, 3, 2, 0); ! left-justify style_Header
            gg_mainwin = glk_window_open(0, 0, 0, 3, GG_MAINWIN_ROCK);
		}
        if (gg_mainwin == 0) quit; ! If we can't even open one window, give in
    }
    else {
        ! There was already a story window. We should erase it.
        glk_window_clear(gg_mainwin);
    }

    if (gg_statuswin == 0) {
        res = InitGlkWindow(GG_STATUSWIN_ROCK);
        if (res == 0) {
            statuswin_cursize = statuswin_size;
			for (res=0: res<=10: res++)
				glk_stylehint_set(4, res, 9, 1); ! enable ReverseColor
            gg_statuswin = glk_window_open(gg_mainwin, $12, statuswin_cursize,
                4, GG_STATUSWIN_ROCK);
        }
    }
    ! It's possible that the status window couldn't be opened, in which case
    ! gg_statuswin is now zero. We must allow for that later on.

    glk_set_window(gg_mainwin);

    InitGlkWindow(1);

	if (glk_gestalt(gestalt_Sound, 0)) {
		if (gg_foregroundchan == 0)
			gg_foregroundchan = glk_schannel_create(GG_FOREGROUNDCHAN_ROCK);
		if (gg_backgroundchan == 0)
			gg_backgroundchan = glk_schannel_create(GG_BACKGROUNDCHAN_ROCK);
	}

	glk_stylehint_set(wintype_TextBuffer, style_Emphasized, stylehint_Weight, 0);
	glk_stylehint_set(wintype_TextBuffer, style_Emphasized, stylehint_Oblique, 1);

	#ifdef FIX_RNG;
	@random 10000 i;
	i = -i-2000;
	print "[Random number generator seed is ", i, "]^";
	@setrandom i;
	#endif; ! FIX_RNG
];

[ GGRecoverObjects id;
    ! If GGRecoverObjects() has been called, all these stored IDs are
    ! invalid, so we start by clearing them all out.
    ! (In fact, after a restoreundo, some of them may still be good.
    ! For simplicity, though, we assume the general case.)
    gg_mainwin = 0;
    gg_statuswin = 0;
    gg_quotewin = 0;
    gg_scriptfref = 0;
    gg_scriptstr = 0;
    gg_savestr = 0;
    statuswin_cursize = 0;
    #Ifdef DEBUG;
    gg_commandstr = 0;
    gg_command_reading = false;
    #Endif; ! DEBUG
    ! Also tell the game to clear its object references.
    IdentifyGlkObject(0);

    ! Check for FyreVM
    @gestalt 4 20 is_fyrevm;
    if (is_fyrevm) return;

    id = glk_stream_iterate(0, gg_arguments);
    while (id) {
        switch (gg_arguments-->0) {
            GG_SAVESTR_ROCK: gg_savestr = id;
            GG_SCRIPTSTR_ROCK: gg_scriptstr = id;
            #Ifdef DEBUG;
            GG_COMMANDWSTR_ROCK: gg_commandstr = id;
                                 gg_command_reading = false;
            GG_COMMANDRSTR_ROCK: gg_commandstr = id;
                                 gg_command_reading = true;
            #Endif; ! DEBUG
            default: IdentifyGlkObject(1, 1, id, gg_arguments-->0);
        }
        id = glk_stream_iterate(id, gg_arguments);
    }

    id = glk_window_iterate(0, gg_arguments);
    while (id) {
        switch (gg_arguments-->0) {
            GG_MAINWIN_ROCK: gg_mainwin = id;
            GG_STATUSWIN_ROCK: gg_statuswin = id;
            GG_QUOTEWIN_ROCK: gg_quotewin = id;
            default: IdentifyGlkObject(1, 0, id, gg_arguments-->0);
        }
        id = glk_window_iterate(id, gg_arguments);
    }

    id = glk_fileref_iterate(0, gg_arguments);
    while (id) {
        switch (gg_arguments-->0) {
            GG_SCRIPTFREF_ROCK: gg_scriptfref = id;
            default: IdentifyGlkObject(1, 2, id, gg_arguments-->0);
        }
        id = glk_fileref_iterate(id, gg_arguments);
    }

    ! Tell the game to tie up any loose ends.
    IdentifyGlkObject(2);
];
-) instead of "Starting Up" in "Glulx.i6t".

Include (-
[ VM_KeyChar win nostat done res ix jx ch;
    if (is_fyrevm) return FyreCall(FY_READKEY);
    jx = ch; ! squash compiler warnings
    if (win == 0) win = gg_mainwin;
    if (gg_commandstr ~= 0 && gg_command_reading ~= false) {
        done = glk_get_line_stream(gg_commandstr, gg_arguments, 31);
        if (done == 0) {
            glk_stream_close(gg_commandstr);
            gg_commandstr = 0;
            gg_command_reading = false;
            ! fall through to normal user input.
        } else {
            ! Trim the trailing newline
            if (gg_arguments->(done-1) == 10) done = done-1;
            res = gg_arguments->0;
            if (res == '\') {
                res = 0;
                for (ix=1 : ix<done : ix++) {
                    ch = gg_arguments->ix;
                    if (ch >= '0' && ch <= '9') {
                        @shiftl res 4 res;
                        res = res + (ch-'0');
                    } else if (ch >= 'a' && ch <= 'f') {
                        @shiftl res 4 res;
                        res = res + (ch+10-'a');
                    } else if (ch >= 'A' && ch <= 'F') {
                        @shiftl res 4 res;
                        res = res + (ch+10-'A');
                    }
                }
            }
       		jump KCPContinue;
        }
    }
    done = false;
    glk_request_char_event(win);
    while (~~done) {
        glk_select(gg_event);
        switch (gg_event-->0) {
          5: ! evtype_Arrange
            if (nostat) {
                glk_cancel_char_event(win);
                res = $80000000;
                done = true;
                break;
            }
            DrawStatusLine();
          2: ! evtype_CharInput
            if (gg_event-->1 == win) {
                res = gg_event-->2;
                done = true;
                }
        }
        ix = HandleGlkEvent(gg_event, 1, gg_arguments);
        if (ix == 2) {
            res = gg_arguments-->0;
            done = true;
        } else if (ix == -1)  done = false;
    }
    if (gg_commandstr ~= 0 && gg_command_reading == false) {
        if (res < 32 || res >= 256 || (res == '\' or ' ')) {
            glk_put_char_stream(gg_commandstr, '\');
            done = 0;
            jx = res;
            for (ix=0 : ix<8 : ix++) {
                @ushiftr jx 28 ch;
                @shiftl jx 4 jx;
                ch = ch & $0F;
                if (ch ~= 0 || ix == 7) done = 1;
                if (done) {
                    if (ch >= 0 && ch <= 9) ch = ch + '0';
                    else                    ch = (ch - 10) + 'A';
                    glk_put_char_stream(gg_commandstr, ch);
                }
            }
        } else {
            glk_put_char_stream(gg_commandstr, res);
        }
        glk_put_char_stream(gg_commandstr, 10); ! newline
    }
  .KCPContinue;
    return res;
];

[ VM_KeyDelay tenths  key done ix;
    if (is_fyrevm) rfalse; ! FyreVM doesn't support timed input
    glk_request_char_event(gg_mainwin);
    glk_request_timer_events(tenths*100);
    while (~~done) {
        glk_select(gg_event);
        ix = HandleGlkEvent(gg_event, 1, gg_arguments);
        if (ix == 2) {
            key = gg_arguments-->0;
            done = true;
        }
        else if (ix >= 0 && gg_event-->0 == 1 or 2) {
            key = gg_event-->2;
            done = true;
        }
    }
    glk_cancel_char_event(gg_mainwin);
    glk_request_timer_events(0);
    return key;
];

[ VM_ReadKeyboard  a_buffer a_table done ix;
    if (is_fyrevm) {
        FyreCall(FY_READLINE, a_buffer, INPUT_BUFFER_LEN);
        jump KPContinue;
    }
    if (gg_commandstr ~= 0 && gg_command_reading ~= false) {
        done = glk_get_line_stream(gg_commandstr, a_buffer+WORDSIZE,
        	(INPUT_BUFFER_LEN-WORDSIZE)-1);
        if (done == 0) {
            glk_stream_close(gg_commandstr);
            gg_commandstr = 0;
            gg_command_reading = false;
            ! L__M(##CommandsRead, 5); would come after prompt
            ! fall through to normal user input.
        }
        else {
            ! Trim the trailing newline
            if ((a_buffer+WORDSIZE)->(done-1) == 10) done = done-1;
            a_buffer-->0 = done;
            VM_Style(INPUT_VMSTY);
            glk_put_buffer(a_buffer+WORDSIZE, done);
            VM_Style(NORMAL_VMSTY);
            print "^";
            jump KPContinue;
        }
    }
    done = false;
    glk_request_line_event(gg_mainwin, a_buffer+WORDSIZE, INPUT_BUFFER_LEN-WORDSIZE, 0);
    while (~~done) {
        glk_select(gg_event);
        switch (gg_event-->0) {
          5: ! evtype_Arrange
            DrawStatusLine();
          3: ! evtype_LineInput
            if (gg_event-->1 == gg_mainwin) {
                a_buffer-->0 = gg_event-->2;
                done = true;
            }
        }
        ix = HandleGlkEvent(gg_event, 0, a_buffer);
        if (ix == 2) done = true;
        else if (ix == -1) done = false;
    }
    if (gg_commandstr ~= 0 && gg_command_reading == false) {
        glk_put_buffer_stream(gg_commandstr, a_buffer+WORDSIZE, a_buffer-->0);
        glk_put_char_stream(gg_commandstr, 10); ! newline
    }
  .KPContinue;
    VM_Tokenise(a_buffer,a_table);
    ! It's time to close any quote window we've got going.
    if (gg_quotewin) {
        glk_window_close(gg_quotewin, 0);
        gg_quotewin = 0;
    }
    #ifdef ECHO_COMMANDS;
    print "** ";
    for (ix=WORDSIZE: ix<(a_buffer-->0)+WORDSIZE: ix++) print (char) a_buffer->ix;
    print "^";
    #endif; ! ECHO_COMMANDS
];
-) instead of "Keyboard Input" in "Glulx.i6t".

Include (-
[ VM_Picture resource_ID;
	if ((~~is_fyrevm) && glk_gestalt(gestalt_Graphics, 0)) {
		glk_image_draw(gg_mainwin, resource_ID, imagealign_InlineCenter, 0);
	} else {
		print "[Picture number ", resource_ID, " here.]^";
	}
];

[ VM_SoundEffect resource_ID;
	if ((~~is_fyrevm) && glk_gestalt(gestalt_Sound, 0)) {
		glk_schannel_play(gg_foregroundchan, resource_ID);
	} else {
		print "[Sound effect number ", resource_ID, " here.]^";
	}
];
-) instead of "Audiovisual Resources" in "Glulx.i6t".

[ FyreVM does not do anything about styles. This has to be managed in the game file with markup. ]

Include (-
[ VM_Style sty;
	if (~~is_fyrevm) {
		switch (sty) {
			NORMAL_VMSTY:     glk_set_style(style_Normal);
			HEADER_VMSTY:     glk_set_style(style_Header);
			SUBHEADER_VMSTY:  glk_set_style(style_Subheader);
			NOTE_VMSTY:       glk_set_style(style_Note);
			ALERT_VMSTY:      glk_set_style(style_Alert);
			BLOCKQUOTE_VMSTY: glk_set_style(style_BlockQuote);
			INPUT_VMSTY:      glk_set_style(style_Input);
		}
	}
];
-) instead of "Typography" in "Glulx.i6t".

Include (-
[ VM_UpperToLowerCase c;
	if (is_fyrevm) return FyreCall(FY_TOLOWER, c);
	return glk_char_to_lower(c);
];
[ VM_LowerToUpperCase c;
	if (is_fyrevm) return FyreCall(FY_TOUPPER, c);
	return glk_char_to_upper(c);
];
-) instead of "Character Casing" in "Glulx.i6t".

Include (-
! Glulx_PrintAnything()                    <nothing printed>
! Glulx_PrintAnything(0)                   <nothing printed>
! Glulx_PrintAnything("string");           print (string) "string";
! Glulx_PrintAnything('word')              print (address) 'word';
! Glulx_PrintAnything(obj)                 print (name) obj;
! Glulx_PrintAnything(obj, prop)           obj.prop();
! Glulx_PrintAnything(obj, prop, args...)  obj.prop(args...);
! Glulx_PrintAnything(func)                func();
! Glulx_PrintAnything(func, args...)       func(args...);

[ Glulx_PrintAnything _vararg_count obj mclass;
    if (_vararg_count == 0) return;
    @copy sp obj;
    _vararg_count--;
    if (obj == 0) return;

    if (obj->0 == $60) {
        ! Dictionary word. Metaclass() can't catch this case, so we do it manually
        print (address) obj;
        return;
    }

    mclass = metaclass(obj);
    switch (mclass) {
      nothing:
        return;
      String:
        print (string) obj;
        return;
      Routine:
        ! Call the function with all the arguments which are already
        ! on the stack.
        @call obj _vararg_count 0;
        return;
      Object:
        if (_vararg_count == 0) {
            print (name) obj;
        }
        else {
            ! Push the object back onto the stack, and call the
            ! veneer routine that handles obj.prop() calls.
            @copy obj sp;
            _vararg_count++;
            @call CA__Pr _vararg_count 0;
        }
        return;
    }
];

[ Glulx_PrintAnyToArray _vararg_count arr arrlen str oldstr len;
    @copy sp arr;
    @copy sp arrlen;
    _vararg_count = _vararg_count - 2;

    if (is_fyrevm) {
        OpenOutputBuffer(arr, arrlen);
    } else {
        oldstr = glk_stream_get_current();
        str = glk_stream_open_memory(arr, arrlen, 1, 0);
        if (str == 0) return 0;
        glk_stream_set_current(str);
    }

    @call Glulx_PrintAnything _vararg_count 0;

    if (is_fyrevm) {
        len = CloseOutputBuffer(0);
    } else {
        glk_stream_set_current(oldstr);
        @copy $ffffffff sp;
        @copy str sp;
        @glk $0044 2 0; ! stream_close
        @copy sp len;
        @copy sp 0;
    }
    return len;
];

Constant GG_ANYTOSTRING_LEN 66;
Array AnyToStrArr -> GG_ANYTOSTRING_LEN+1;

[ Glulx_ChangeAnyToCString _vararg_count ix len;
    ix = GG_ANYTOSTRING_LEN-2;
    @copy ix sp;
    ix = AnyToStrArr+1;
    @copy ix sp;
    ix = _vararg_count+2;
    @call Glulx_PrintAnyToArray ix len;
    AnyToStrArr->0 = $E0;
    if (len >= GG_ANYTOSTRING_LEN)
        len = GG_ANYTOSTRING_LEN-1;
    AnyToStrArr->(len+1) = 0;
    return AnyToStrArr;
];
-) instead of "Glulx-Only Printing Routines" in "Glulx.i6t".

Include (-
[ VM_ClearScreen window;
    if (is_fyrevm) return; ! not supported
    if (window == WIN_ALL or WIN_MAIN) {
        glk_window_clear(gg_mainwin);
        if (gg_quotewin) {
            glk_window_close(gg_quotewin, 0);
            gg_quotewin = 0;
        }
    }
    if (gg_statuswin && window == WIN_ALL or WIN_STATUS) glk_window_clear(gg_statuswin);
];

[ VM_ScreenWidth  id;
    if (is_fyrevm) return 80; ! not supported
    id=gg_mainwin;
    if (gg_statuswin && statuswin_current) id = gg_statuswin;
    glk_window_get_size(id, gg_arguments, 0);
    return gg_arguments-->0;
];

[ VM_ScreenHeight;
    if (is_fyrevm) return 25; ! not supported
    glk_window_get_size(gg_mainwin, 0, gg_arguments);
    return gg_arguments-->0;
];
-) instead of "The Screen" in "Glulx.i6t".

Include (-
[ VM_SetWindowColours f b window doclear  i fwd bwd swin;
    if (is_fyrevm) return; ! not supported
    if (clr_on && f && b) {
        if (window) swin = 5-window; ! 4 for TextGrid, 3 for TextBuffer

        fwd = MakeColourWord(f);
        bwd = MakeColourWord(b);
        for (i=0 : i<=10: i++) {
            if (f == CLR_DEFAULT || b == CLR_DEFAULT) {  ! remove style hints
                glk_stylehint_clear(swin, i, 7);
                glk_stylehint_clear(swin, i, 8);
            } else {
                glk_stylehint_set(swin, i, 7, fwd);
                glk_stylehint_set(swin, i, 8, bwd);
            }
        }

        ! Now re-open the windows to apply the hints
        if (gg_statuswin) glk_window_close(gg_statuswin, 0);

        if (doclear || ( window ~= 1 && (clr_fg ~= f || clr_bg ~= b) ) ) {
            glk_window_close(gg_mainwin, 0);
            gg_mainwin = glk_window_open(0, 0, 0, 3, GG_MAINWIN_ROCK);
            if (gg_scriptstr ~= 0)
                glk_window_set_echo_stream(gg_mainwin, gg_scriptstr);
        }

        gg_statuswin =
        	glk_window_open(gg_mainwin, $12, statuswin_cursize, 4, GG_STATUSWIN_ROCK);
        if (statuswin_current && gg_statuswin) VM_MoveCursorInStatusLine(); else VM_MainWindow();

        if (window ~= 2) {
            clr_fgstatus = f;
            clr_bgstatus = b;
        }
        if (window ~= 1) {
            clr_fg = f;
            clr_bg = b;
        }
    }
];

[ VM_RestoreWindowColours; ! used after UNDO: compare I6 patch L61007
    if (is_fyrevm) return; ! not supported
    if (clr_on) { ! check colour has been used
        VM_SetWindowColours(clr_fg, clr_bg, 2); ! make sure both sets of variables are restored
        VM_SetWindowColours(clr_fgstatus, clr_bgstatus, 1, true);
        VM_ClearScreen();
    }
];

[ MakeColourWord c;
    if (c > 9) return c;
    c = c-2;
    return $ff0000*(c&1) + $ff00*(c&2 ~= 0) + $ff*(c&4 ~= 0);
];
-) instead of "Window Colours" in "Glulx.i6t".

Include (-
[ VM_MainWindow;
    if (is_fyrevm) return; ! not supported
    glk_set_window(gg_mainwin); ! set_window
    statuswin_current=0;
];
-) instead of "Main Window" in "Glulx.i6t".

Include (-
[ VM_StatusLineHeight hgt;
    if (is_fyrevm) return; ! not supported
    if (gg_statuswin == 0) return;
    if (hgt == statuswin_cursize) return;
    glk_window_set_arrangement(glk_window_get_parent(gg_statuswin), $12, hgt, 0);
    statuswin_cursize = hgt;
];

[ VM_MoveCursorInStatusLine line column;
    if (is_fyrevm) return; ! not supported
    if (gg_statuswin) glk_set_window(gg_statuswin);
    if (line == 0) { line = 1; column = 1; }
    glk_window_move_cursor(gg_statuswin, column-1, line-1);
    statuswin_current=1;
];
-) instead of "Status Line" in "Glulx.i6t".

Include (-
[ Box__Routine maxwid arr ix lines lastnl parwin;
    if (is_fyrevm) return; ! not supported
    maxwid = 0; ! squash compiler warning
    lines = arr-->0;

    if (gg_quotewin == 0) {
        gg_arguments-->0 = lines;
        ix = InitGlkWindow(GG_QUOTEWIN_ROCK);
        if (ix == 0)
            gg_quotewin =
            	glk_window_open(gg_mainwin, $12, lines, 3, GG_QUOTEWIN_ROCK);
    } else {
        parwin = glk_window_get_parent(gg_quotewin);
        glk_window_set_arrangement(parwin, $12, lines, 0);
    }

    lastnl = true;
    if (gg_quotewin) {
        glk_window_clear(gg_quotewin);
        glk_set_window(gg_quotewin);
        lastnl = false;
    }

	VM_Style(BLOCKQUOTE_VMSTY);
    for (ix=0 : ix<lines : ix++) {
        print (string) arr-->(ix+1);
        if (ix < lines-1 || lastnl) new_line;
    }
	VM_Style(NORMAL_VMSTY);

    if (gg_quotewin) glk_set_window(gg_mainwin);
];
-) instead of "Quotation Boxes" in "Glulx.i6t".

Include (-
#Ifdef DEBUG;
[ GlkListSub id val;
    if (is_fyrevm) {
        print "Glk is not used with this interpreter.^";
        return;
    }
    id = glk_window_iterate(0, gg_arguments);
    while (id) {
        print "Window ", id, " (", gg_arguments-->0, "): ";
        val = glk_window_get_type(id);
        switch (val) {
          1: print "pair";
          2: print "blank";
          3: print "textbuffer";
          4: print "textgrid";
          5: print "graphics";
          default: print "unknown";
        }
        val = glk_window_get_parent(id);
        if (val) print ", parent is window ", val;
        else     print ", no parent (root)";
        val = glk_window_get_stream(id);
        print ", stream ", val;
        val = glk_window_get_echo_stream(id);
        if (val) print ", echo stream ", val;
        print "^";
        id = glk_window_iterate(id, gg_arguments);
    }
    id = glk_stream_iterate(0, gg_arguments);
    while (id) {
        print "Stream ", id, " (", gg_arguments-->0, ")^";
        id = glk_stream_iterate(id, gg_arguments);
    }
    id = glk_fileref_iterate(0, gg_arguments);
    while (id) {
        print "Fileref ", id, " (", gg_arguments-->0, ")^";
        id = glk_fileref_iterate(id, gg_arguments);
    }
    if (glk_gestalt(gestalt_Sound, 0)) {
        id = glk_schannel_iterate(0, gg_arguments);
        while (id) {
            print "Soundchannel ", id, " (", gg_arguments-->0, ")^";
            id = glk_schannel_iterate(id, gg_arguments);
        }
    }
];

Verb meta 'glklist'
    *                                           -> Glklist;
#Endif;
-) instead of "GlkList Command" in "Glulx.i6t".

Include (-
[ QUIT_THE_GAME_R;
	if (actor ~= player) rfalse;
	if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_PROMPT);
	GL__M(##Quit, 2);
	if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_MAIN);
	if (YesOrNo()~=0) quit;
];
-) instead of "Quit The Game Rule" in "Glulx.i6t".

Include (-
[ RESTART_THE_GAME_R;
	if (actor ~= player) rfalse;
	if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_PROMPT);
	GL__M(##Restart, 1);
	if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_MAIN);
	if (YesOrNo() ~= 0) {
		@restart;
		GL__M(##Restart, 2);
	}
];
-) instead of "Restart The Game Rule" in "Glulx.i6t".

Include (-
[ RESTORE_THE_GAME_R res fref;
	if (actor ~= player) rfalse;
	if (is_fyrevm) {
		@restore 0 res;
	} else {
		fref = glk_fileref_create_by_prompt($01, $02, 0);
		if (fref == 0) jump RFailed;
		gg_savestr = glk_stream_open_file(fref, $02, GG_SAVESTR_ROCK);
		glk_fileref_destroy(fref);
		if (gg_savestr == 0) jump RFailed;
		@restore gg_savestr res;
		glk_stream_close(gg_savestr, 0);
		gg_savestr = 0;
	}
	.RFailed;
	GL__M(##Restore, 1);
];
-) instead of "Restore The Game Rule" in "Glulx.i6t".

Include (-
[ SAVE_THE_GAME_R res fref;
	if (actor ~= player) rfalse;
	if (is_fyrevm) {
		@save 0 res;
		if (res == -1) {
			! The player actually just typed "restore". We're going to print
			!  GL__M(##Restore,2); the Z-Code Inform library does this correctly
			! now. But first, we have to recover all the Glk objects; the values
			! in our global variables are all wrong.
			GGRecoverObjects();
			return GL__M(##Restore, 2);
		}
	} else {
		fref = glk_fileref_create_by_prompt($01, $01, 0);
		if (fref == 0) jump SFailed;
		gg_savestr = glk_stream_open_file(fref, $01, GG_SAVESTR_ROCK);
		glk_fileref_destroy(fref);
		if (gg_savestr == 0) jump SFailed;
		@save gg_savestr res;
		if (res == -1) {
			! The player actually just typed "restore". We're going to print
			!  GL__M(##Restore,2); the Z-Code Inform library does this correctly
			! now. But first, we have to recover all the Glk objects; the values
			! in our global variables are all wrong.
			GGRecoverObjects();
			glk_stream_close(gg_savestr, 0); ! stream_close
			gg_savestr = 0;
			return GL__M(##Restore, 2);
		}
		glk_stream_close(gg_savestr, 0); ! stream_close
		gg_savestr = 0;
	}
	if (res == 0) return GL__M(##Save, 2);
	.SFailed;
	GL__M(##Save, 1);
];
-) instead of "Save The Game Rule" in "Glulx.i6t".

Include (-
[ SWITCH_TRANSCRIPT_ON_R;
	if (actor ~= player) rfalse;
	if (is_fyrevm) {
		print "Transcripting is not available with this interpreter.^";
		return;
	}
	if (gg_scriptstr ~= 0) return GL__M(##ScriptOn, 1);
	if (gg_scriptfref == 0) {
		gg_scriptfref = glk_fileref_create_by_prompt($102, $05, GG_SCRIPTFREF_ROCK);
		if (gg_scriptfref == 0) jump S1Failed;
	}
	! stream_open_file
	gg_scriptstr = glk_stream_open_file(gg_scriptfref, $05, GG_SCRIPTSTR_ROCK);
	if (gg_scriptstr == 0) jump S1Failed;
	glk_window_set_echo_stream(gg_mainwin, gg_scriptstr);
	GL__M(##ScriptOn, 2);
	VersionSub();
	return;
	.S1Failed;
	GL__M(##ScriptOn, 3);
];
-) instead of "Switch Transcript On Rule" in "Glulx.i6t".

Include (-
[ SWITCH_TRANSCRIPT_OFF_R;
	if (actor ~= player) rfalse;
	if (is_fyrevm) {
		print "Transcripting is not available with this interpreter.^";
		return;
	}
	if (gg_scriptstr == 0) return GL__M(##ScriptOff,1);
	GL__M(##ScriptOff, 2);
	glk_stream_close(gg_scriptstr, 0); ! stream_close
	gg_scriptstr = 0;
];
-) instead of "Switch Transcript Off Rule" in "Glulx.i6t".

Section 2 - Printing segment

Include (-
[ PrintPrompt i;
	if (is_fyrevm) {
		FyreCall(FY_CHANNEL, FYC_PROMPT);
		PrintText( (+ command prompt +) );
		FyreCall(FY_CHANNEL, FYC_MAIN);
	} else {
		style roman;
		EnsureBreakBeforePrompt();
		PrintText( (+ command prompt +) );
	}
	ClearBoxedText();
	ClearParagraphing();
	enable_rte = true;
];
-) instead of "Prompt" in "Printing.i6t".

Include (-
#Ifdef TARGET_ZCODE;
#Iftrue (#version_number == 6);
[ DrawStatusLine; Z6_DrawStatusLine(); ];
#Endif;
#Endif;

#Ifndef DrawStatusLine;
[ DrawStatusLine width posb;
	@push say__p; @push say__pc;
	if (is_fyrevm) {
		BeginActivity(CONSTRUCTING_STATUS_LINE_ACT);
		ClearParagraphing();
		if (ForActivity(CONSTRUCTING_STATUS_LINE_ACT) == false) {
			FyreCall(FY_CHANNEL, FYC_LOCATION);
			SL_Location();

			#ifndef NO_SCORE;
			FyreCall(FY_CHANNEL, FYC_SCORE);
			print sline1;
			#endif;
			
			FyreCall(FY_CHANNEL, FYC_TIME);
			print the_time;

			FyreCall(FY_CHANNEL, FYC_TURN);
			print turns;
		}
		ClearParagraphing();
		FyreCall(FY_CHANNEL, FYC_MAIN);
		EndActivity(CONSTRUCTING_STATUS_LINE_ACT);
	} else {
		BeginActivity(CONSTRUCTING_STATUS_LINE_ACT);
		VM_StatusLineHeight(1); VM_MoveCursorInStatusLine(1, 1); 
		width = VM_ScreenWidth(); posb = width-15;
		spaces width;
		ClearParagraphing();
		if (ForActivity(CONSTRUCTING_STATUS_LINE_ACT) == false) {
			VM_MoveCursorInStatusLine(1, 2);
			switch(metaclass(left_hand_status_line)) {
				String: print (string) left_hand_status_line;
				Routine: left_hand_status_line();
			}
			VM_MoveCursorInStatusLine(1, posb);
			switch(metaclass(right_hand_status_line)) {
				String: print (string) right_hand_status_line;
				Routine: right_hand_status_line();
			}
		}
		VM_MoveCursorInStatusLine(1, 1); VM_MainWindow();
		ClearParagraphing();
		EndActivity(CONSTRUCTING_STATUS_LINE_ACT);
	}
	@pull say__pc; @pull say__p;
];
#Endif;
-) instead of "Status Line" in "Printing.i6t".

Section 3 - IndexedText segment

Include (-
#ifndef IT_MemoryBufferSize;
Constant IT_MemoryBufferSize = 512;
#endif;

Constant IT_Memory_NoBuffers = 2;

#ifndef IT_Memory_NoBuffers;
Constant IT_Memory_NoBuffers = 1;
#endif;

#ifdef TARGET_ZCODE;
Array IT_MemoryBuffer -> IT_MemoryBufferSize*IT_Memory_NoBuffers; ! Where characters are bytes
#ifnot;
Array IT_MemoryBuffer --> (IT_MemoryBufferSize+2)*IT_Memory_NoBuffers; ! Where characters are words
#endif;

Global RawBufferAddress = IT_MemoryBuffer;
Global RawBufferSize = IT_MemoryBufferSize;

Global IT_cast_nesting;

[ INDEXED_TEXT_TY_Cast tx fromkov indt
	len i str oldstr offs realloc news buff buffx freebuff results;
	#ifdef TARGET_ZCODE;
	buffx = IT_MemoryBufferSize;
	#ifnot;
	buffx = (IT_MemoryBufferSize + 2)*WORDSIZE;
	#endif;
	
	buff = RawBufferAddress + IT_cast_nesting*buffx;
	IT_cast_nesting++;
	if (IT_cast_nesting > IT_Memory_NoBuffers) {
		buff = VM_AllocateMemory(buffx); freebuff = buff;
		if (buff == 0) {
			BlkAllocationError("ran out with too many simultaneous indexed text conversions");
			return;
		}
	}

	.RetryWithLargerBuffer;
	if (tx == 0) {
		#ifdef TARGET_ZCODE;
		buff-->0 = 1;
		buff->2 = 0;
		#ifnot;
		buff-->0 = 0;
		#endif;
		len = 1;
	} else {
		#ifdef TARGET_ZCODE;
		@output_stream 3 buff;
		#ifnot;
		if (unicode_gestalt_ok == false) { RunTimeProblem(RTP_NOGLULXUNICODE); jump Failed; }
		if (is_fyrevm) {
			OpenOutputBufferUnicode(buff, RawBufferSize);
		} else {
			oldstr = glk_stream_get_current();
			str = glk_stream_open_memory_uni(buff, RawBufferSize, filemode_Write, 0);
			glk_stream_set_current(str);
		}
		#endif;

		@push say__p; @push say__pc;
		ClearParagraphing();
		if (fromkov == SNIPPET_TY) print (PrintSnippet) tx;
		else {
			if (tx ofclass String) print (string) tx;
			if (tx ofclass Routine) (tx)();	
		}
		@pull say__pc; @pull say__p;

		#ifdef TARGET_ZCODE;

		@output_stream -3;
		len = buff-->0;
		if (len > RawBufferSize-1) len = RawBufferSize-1;
		offs = 2;
		buff->(len+2) = 0;

		#ifnot; ! i.e. GLULX
		
		results = buff + buffx - 2*WORDSIZE;
		if (is_fyrevm) {
			CloseOutputBuffer(results);
		} else {
			glk_stream_close(str, results);
			if (oldstr) glk_stream_set_current(oldstr);
		}
		len = results-->1;
		if (len > RawBufferSize-1) {
			! Glulx had to truncate text output because the buffer ran out:
			! len is the number of characters which it tried to print
			news = RawBufferSize;
			while (news < len) news=news*2;
			news = news*4; ! Bytes rather than words
			i = VM_AllocateMemory(news);
			if (i ~= 0) {
				if (freebuff) VM_FreeMemory(freebuff);
				freebuff = i;
				buff = i;
				RawBufferSize = news/4;
				jump RetryWithLargerBuffer;
			}
			! Memory allocation refused: all we can do is to truncate the text
			len = RawBufferSize-1;
		}
		offs = 0;
		buff-->(len) = 0;

		#endif;

		len++;
	}

	IT_cast_nesting--;

	if (indt == 0) {
		indt = BlkAllocate(len+1, INDEXED_TEXT_TY, IT_Storage_Flags);
		if (indt == 0) jump Failed;
	} else {
		if (BlkValueSetExtent(indt, len+1, 1) == false) { indt = 0; jump Failed; }
	}

	#ifdef TARGET_ZCODE;
	for (i=0:i<=len:i++) BlkValueWrite(indt, i, buff->(i+offs));
	#ifnot;
	for (i=0:i<=len:i++) BlkValueWrite(indt, i, buff-->(i+offs));
	#endif;

	.Failed;
	if (freebuff) VM_FreeMemory(freebuff);

	return indt;
];
-) instead of "Casting" in "IndexedText.i6t".

Include (-
[ INDEXED_TEXT_TY_Say indt  ch i dsize;
	if ((indt==0) || (BlkType(indt) ~= INDEXED_TEXT_TY)) return;
	dsize = BlkValueExtent(indt);
	for (i=0:i<dsize:i++) {
		ch = BlkValueRead(indt, i);
		if (ch == 0) break;
		#ifdef TARGET_ZCODE;
		print (char) ch;
		#ifnot; ! TARGET_ZCODE
		@streamunichar ch;
		#endif;
	}
];
-) instead of "Printing" in "IndexedText.i6t".

Section 4 - Parser segment

Include (-
[ YesOrNo i j;
    for (::) {
        #Ifdef TARGET_ZCODE;
        if (location == nothing || parent(player) == nothing) read buffer parse;
        else read buffer parse DrawStatusLine;
        j = parse->1;
        #Ifnot; ! TARGET_GLULX;
        KeyboardPrimitive(buffer, parse);
        j = parse-->0;
        #Endif; ! TARGET_
        if (j) { ! at least one word entered
            i = parse-->1;
            if (i == YES1__WD or YES2__WD or YES3__WD) rtrue;
            if (i == NO1__WD or NO2__WD or NO3__WD) rfalse;
        }
        #ifdef TARGET_GLULX; if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_PROMPT); #endif;
        L__M(##Quit, 1); print "> ";
        #ifdef TARGET_GLULX; if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_MAIN); #endif;
    }
];
-) instead of "Yes/No Questions" in "Parser.i6t".

Section 5 - Death

Include (-
[ PRINT_OBITUARY_HEADLINE_R;
    #ifdef TARGET_GLULX; if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_DEATH); #endif;
    print "^^    ";
    VM_Style(ALERT_VMSTY);
    print "***";
    if (deadflag == 1) L__M(##Miscellany, 3);
    if (deadflag == 2) L__M(##Miscellany, 4);
    if (deadflag ~= 0 or 1 or 2)  {
        print " ";
        if (deadflag ofclass Routine) (deadflag)();
		if (deadflag ofclass String) print (string) deadflag;
        print " ";
    }
    print "***";
    VM_Style(NORMAL_VMSTY);
    print "^^"; #Ifndef NO_SCORE; print "^"; #Endif;
    #ifdef TARGET_GLULX; if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_MAIN); #endif;
    rfalse;
];
-) instead of "Print Obituary Headline Rule" in "OrderOfPlay.i6t".

Chapter 3 - Standard Rules replacements

This is the direct the final prompt to the prompt channel rule:
	select the prompt channel;
	follow the print the final prompt rule;
	select the main channel.

The direct the final prompt to the prompt channel rule is listed instead of the print the final prompt rule in before handling the final question.

Chapter 4 - Channel Rules

Section 1 - Required Channels

To Select the Main Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_MAIN); -).

To Select the Prompt Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_PROMPT); -).

To Change the Prompt to (T - text):
	Select the Prompt Channel;
	say T;
	Select the Main Channel.

To Select the Location Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_LOCATION); -).

To Select the Score Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_SCORE); -).

To Select the Time Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_TIME); -).

To Select the Death Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_DEATH); -);

Section 2 - Additional Channels
	
To Select the Title Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_TITLE); -).

To Select the Credits Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_CREDITS); -);

To Select the Prologue Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_PROLOGUE); -).

To Select the Turn Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_TURN); -).

To Select the Hint Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_HINT); -).

To Select the Help Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_HELP); -).

To Select the Map Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_MAP); -).

To Select the Sound Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_SOUND); -).

To Select the Chapter Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_CHAPTER); -);

To Set the Chapter to (T - text):
	Select the Chapter Channel;
	say T;
	Select the Main Channel.

To Select the Achievement Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_ACHIEVEMENT); -);

To Select the Tips Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_TIPS); -);

To Select the Version Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_VERSION); -);

To Set the Version to (T - text):
	Select the Version Channel;
	say T;
	Select the Main Channel.

To Select the Verb List Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_VERB); -);

Chapter 5 - Transition Requested

To Request Transition:
	(- if (is_fyrevm) FyreCall(FY_REQUEST_TRANSITION); -);

FyreVM Support without Output Filtering ends here.

---- DOCUMENTATION ----

FyreVM is a Glulx Virtual Machine implementation that uses Channel IO instead of the standard Glk input/output layer.

The channel system provides text communication from the virtual machine to the user interface (interpreter). The first six channels (main, prompt, location, score, time, and death) are required.

The additional channels (sound, hint, help, map, ) are supported only at the base level and have no implementation in this extension. There are separate extensions with "default" implementations that can be used or you can develop your own extension. If you develop your own, this extension will be required.

Required Channels:

* Main -- The main channel is meant to handle the regular text window output.

* Prompt -- The prompt channel defaults to the common ">" caret, but can be altered to be anything.

* Location -- The location channel contains the current location name.

* Score -- The score channel contains, if any is provided, the current score of the game.

* Time -- The time channel contains the current number of turns or the current time.

* Death -- The death channel contains any output that happens after the player dies. This is separated from the main text so that the UI can handle it contextually.

Additional Channels:

* Title -- The title channel can be used for identifying the title of the game.

* Credits -- The credits channel can be used for identifying the credits for the game.

* Prologue -- The prologue channel can be used for the output at the beginning of a game.

* Turn -- The turn channel has the turn count, regardless if time is the primary timekeeping method.

* Hint -- The hint channel can be used to send hint information to the user interface. Textfyre provides a sample implementation in FyreVM Hint Channel Support by Textfyre.

* Help -- The help channel can be used to send general help information to the user interface. Textfyre provides a sample implementation in FyreVM Help Channel Support by Textfyre.

* Map -- The map channel can be used to send map details to the user interface. Textfyre provides a sample implementation in FyreVM Map Channel Support by Textfyre.

* Sound -- The sound channel allows you to send information about a change to the musical score or theme.

* Chapter -- The chapter channel is used to announce the current chapter of the game.

* Achievement -- The Achievement channel is used to offer feedback to the user or to share progress on Twitter or Facebook.

* Tips -- The tips channel is used by a progressive user interface to help the user understand how to play Interactive Fiction.

* Version -- The version channel is a text based version descriptor used in testing.

For more information, screen shots, and examples, please visit "http://fyrevm.sourcefore.net".
