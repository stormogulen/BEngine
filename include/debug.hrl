%% -*- mode: Erlang; fill-column: 80; comment-column: 70; -*-
%%% -----------------------------------------------------------------------------
%%% debug.hrl
%%% -----------------------------------------------------------------------------
%%% 
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc
%%% Include this debug macro for some "printf-style" debugging.
%%% This gives you the module name and the line number.
%%%  usage: -include("debug.hrl").
%%% @end 
%%% 

-ifdef(debug).
-define(DEBUG(Format, Args), io:format("~s. ~w: DEBUG: " ++ Format, [ ?MODULE, ?LINE | Args])).
-else.
-define(DEBUG(Format, Args), true).
-endif.

% End of File
