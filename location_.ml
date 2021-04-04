(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*             Xavier Leroy, projet Cristal, INRIA Rocquencourt           *)
(*                                                                        *)
(*   Copyright 1996 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

module Lexing = Lexing_

type t = Location.t = {
  loc_start: Lexing.position;
  loc_end: Lexing.position;
  loc_ghost: bool;
}
[@@deriving show]

type 'a loc = 'a Location.loc = {
  txt : 'a;
  loc : t;
}
[@@deriving show]

type error = Location.error =
  {
    loc: t;
    msg: string;
    sub: error list;
    if_highlight: string;
  }
[@@deriving show]
