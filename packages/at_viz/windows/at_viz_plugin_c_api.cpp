#include "include/at_viz/at_viz_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "at_viz_plugin.h"

void AtVizPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  at_viz::AtVizPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
