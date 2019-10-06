_code = {
	Ignatz_PlayerIsSwimming = false;
	waituntil {typeof player in ['Epoch_Male_F','Epoch_Female_F']};
	waituntil {!isNil 'Epoch_my_GroupUID'};
	waituntil {uisleep 2; alive player};
	_eh = {
		player addEventHandler ["AnimChanged", {
			params ["_unit", "_anim"];
			if (_anim in [
				"asswpercmstpsnonwnondnon",
				"asswpercmstpsnonwnondnon_asswpercmrunsnonwnondf",
				"asswpercmrunsnonwnondf",
				"aswmpercmrunsnonwnondf",
				"aswmpercmsprsnonwnondf",
				"abswpercmrunsnonwnondf",
				"abswpercmsprsnonwnondf",
				"asswpercmrunsnonwnondr",
				"aswmpercmrunsnonwnondr",
				"abswpercmrunsnonwnondr",
				"abswpercmrunsnonwnondl",
				"abswpercmstpsnonwnondnon",
				"aswmpercmstpsnonwnondnon",
				"asswpercmrunsnonwnondb",
				"abswpercmrunsnonwnondb",
				"aswmpercmrunsnonwnondb",
				"abswpercmrunsnonwnondfr",
				"abswpercmstpsnonwnondnon_abswpercmrunsnonwnondf",
				"asswpercmsprsnonwnondf"
			]) then {
				player setAnimSpeedCoef 2.5;
			}
			else {
				player setAnimSpeedCoef 1; 
			};
		}];
	};
	call _eh;
	waituntil {uisleep 2; !alive player};
	waituntil {uisleep 2; alive player};
	call _eh;
};
_code remoteExec ["BIS_fnc_spawn", -2, "IG_FastSwim"];
diag_log "Ignatz_Debug: Fast Swim added";