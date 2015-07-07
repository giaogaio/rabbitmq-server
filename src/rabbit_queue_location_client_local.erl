%%% The contents of this file are subject to the Mozilla Public License
%%% Version 1.1 (the "License"); you may not use this file except in
%%% compliance with the License. You may obtain a copy of the License at
%%% http://www.mozilla.org/MPL/
%%%
%%% Software distributed under the License is distributed on an "AS IS"
%%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
%%% License for the specific language governing rights and limitations
%%% under the License.
%%%
%%% The Original Code is RabbitMQ.
%%%
%%% @author Ayanda Dube <ayanda.dube@erlang-solutions.com>
%%% @doc
%%% - Queue Master Location 'client local' selection callback
%%%
%%% @end
%%% Created : 19. Jun 2015
%%%-------------------------------------------------------------------
-module(rabbit_queue_location_client_local).

-include("rabbit.hrl").

-behaviour(rabbit_queue_master_locator).

-export([description/0, queue_master_location/1, validate_policy/1]).

-rabbit_boot_step({?MODULE,
  [{description, "Set queue master node as the client local node"},
    {mfa,         {rabbit_registry, register,
      [queue_master_locator, <<"client-local">>, ?MODULE]}},
    {requires,    rabbit_registry},
    {enables,     kernel_ready}]}).


%%---------------------------------------------------------------------------
%% Queue Master Location Callbacks
%%---------------------------------------------------------------------------

description() ->
  [{description, <<"Set queue master node as the client local node">>}].

queue_master_location(#amqqueue{}) ->
  MasterNode = node(),
  {ok, MasterNode}.

validate_policy(_Args) -> ok.