  /*-------------------------------------
   * GuidedTour Functions
   * Version: 1.0.1 (24.10.2017)
   * Author:  Daniel Hochleitner
   *-------------------------------------
  */
FUNCTION render_shepherdnewinstance(p_dynamic_action IN apex_plugin.t_dynamic_action,
                                    p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  l_theme  VARCHAR2(500) := p_dynamic_action.attribute_01;
  l_result apex_plugin.t_dynamic_action_render_result;
  --
BEGIN
  -- Debug
  IF apex_application.g_debug THEN
    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,
                                          p_dynamic_action => p_dynamic_action);
  END IF;
  --
  -- Shepherd Theme CSS
  IF l_theme = 'shepherd-theme-dark' THEN
    apex_css.add_file(p_name      => 'shepherd-theme-dark',
                      p_directory => p_plugin.file_prefix);
  ELSIF l_theme = 'shepherd-theme-default' THEN
    apex_css.add_file(p_name      => 'shepherd-theme-default',
                      p_directory => p_plugin.file_prefix);
  ELSIF l_theme = 'shepherd-theme-square' THEN
    apex_css.add_file(p_name      => 'shepherd-theme-square',
                      p_directory => p_plugin.file_prefix);
  ELSIF l_theme = 'shepherd-theme-square-dark' THEN
    apex_css.add_file(p_name      => 'shepherd-theme-square-dark',
                      p_directory => p_plugin.file_prefix);
  END IF;
  -- Tether CSS
  apex_css.add_file(p_name      => 'tether.min',
                    p_directory => p_plugin.file_prefix);
  --
  -- Shepherd JS + Tether JS
  apex_javascript.add_library(p_name           => 'tether.min',
                              p_directory      => p_plugin.file_prefix,
                              p_version        => NULL,
                              p_skip_extension => FALSE);
  apex_javascript.add_library(p_name           => 'shepherd.min',
                              p_directory      => p_plugin.file_prefix,
                              p_version        => NULL,
                              p_skip_extension => FALSE);
  -- Add JS Code to Start new Stepherd Instance
  apex_javascript.add_inline_code(p_code => 'var tour = new Shepherd.Tour({defaults: { classes: ''' ||
                                            l_theme ||
                                            ''',scrollTo: true}});');
  --
  l_result.javascript_function := 'function(){null}';
  l_result.attribute_01        := l_theme;
  RETURN l_result;
  --
END render_shepherdnewinstance;