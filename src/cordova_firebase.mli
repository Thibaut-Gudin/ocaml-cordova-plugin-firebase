[@@@js.stop]

module Properties : sig
  type t

  val create : (string * string) list -> t
end

[@@@js.start]

[@@@js.implem
module Properties = struct
  type t = Ojs.t

  let create ls =
    Ojs.obj
      (Array.of_list (List.map (fun (k, v) -> (k, Ojs.string_to_js v)) ls))

  let t_to_js x = Ojs.t_to_js x
end]

[@@@ocamlformat "disable=true"]

val log_event : event:string ->
               ?params:(Properties.t [@js.default Properties.create []]) ->
               unit ->
               unit
               [@@js.global "cordova.plugins.firebase.analytics.logEvent"]

[@@@ocamlformat "disable=false"]

val set_enabled : bool -> unit
  [@@js.global "cordova.plugins.firebase.analytics.setEnabled"]

[@@@js.stop]

val available : unit -> bool

val analytics_available : unit -> bool

[@@@js.start]

[@@@js.implem
let available () =
  Js_of_ocaml.Js.Optdef.test
    Js_of_ocaml.Js.Unsafe.global##.cordova##.plugins##.firebase]

[@@@js.implem
let analytics_available () =
  Js_of_ocaml.Js.Optdef.test
    Js_of_ocaml.Js.Unsafe.global##.cordova##.plugins##.firebase##.analytics]
