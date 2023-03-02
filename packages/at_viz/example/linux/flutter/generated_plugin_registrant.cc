//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <at_viz/at_viz_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) at_viz_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AtVizPlugin");
  at_viz_plugin_register_with_registrar(at_viz_registrar);
}
