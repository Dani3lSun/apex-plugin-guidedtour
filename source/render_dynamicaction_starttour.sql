FUNCTION render_shepherdstarttour(p_dynamic_action IN apex_plugin.t_dynamic_action,
                                  p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  l_result apex_plugin.t_dynamic_action_render_result;
  --
BEGIN
  -- Debug
  IF apex_application.g_debug THEN
    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,
                                          p_dynamic_action => p_dynamic_action);
  END IF;
  -- Add JS Code to Start new Stepherd Instance
  --apex_javascript.add_inline_code(p_code => 'tour.start();');
  apex_javascript.add_onload_code(p_code => 'tour.start();');
  --
  l_result.javascript_function := 'function(){null}';
  --
  RETURN l_result;
  --
END render_shepherdstarttour;