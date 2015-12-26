  /*-------------------------------------
   * GuidedTour Functions
   * Version: 1.0 (03.08.2015)
   * Author:  Daniel Hochleitner
   *-------------------------------------
  */
FUNCTION render_shepherdaddstep(p_dynamic_action IN apex_plugin.t_dynamic_action,
                                p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  l_step_name       VARCHAR2(100) := p_dynamic_action.attribute_01;
  l_step_title      VARCHAR2(100) := p_dynamic_action.attribute_02;
  l_step_text       VARCHAR2(1000) := p_dynamic_action.attribute_03;
  l_attach_to_class VARCHAR2(200) := p_dynamic_action.attribute_04;
  l_btn_close_text  VARCHAR2(50) := p_dynamic_action.attribute_05;
  l_btn_next_text   VARCHAR2(50) := p_dynamic_action.attribute_06;
  l_position        VARCHAR2(50) := p_dynamic_action.attribute_07;
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
  apex_javascript.add_inline_code(p_code => 'tour.addStep("' || l_step_name ||
                                            '", {title: "' || l_step_title ||
                                            '",text: "' || l_step_text ||
                                            '",attachTo: "' ||
                                            l_attach_to_class || ' ' ||
                                            l_position ||
                                            '",buttons: [{text: "' ||
                                            l_btn_close_text ||
                                            '",classes: "shepherd-button-secondary",action: function() {return tour.hide();}},{text: "' ||
                                            l_btn_next_text ||
                                            '",action: tour.next,classes: "shepherd-button-example-primary"}]});');
  --
  l_result.javascript_function := 'function(){null}';
  l_result.attribute_01        := l_step_name;
  l_result.attribute_02        := l_step_title;
  l_result.attribute_03        := l_step_text;
  l_result.attribute_04        := l_attach_to_class;
  l_result.attribute_05        := l_btn_close_text;
  l_result.attribute_06        := l_btn_next_text;
  l_result.attribute_07        := l_position;
  --
  RETURN l_result;
  --
END render_shepherdaddstep;