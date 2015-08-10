set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.1.00.06'
,p_default_workspace_id=>96713923238010156
,p_default_application_id=>57743
,p_default_owner=>'DHTEST'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/de_danielh_gt_starttour
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(11043573231703486949)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'DE.DANIELH.GT.STARTTOUR'
,p_display_name=>'GuidedTour (Start Tour)'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  /*-------------------------------------',
'   * GuidedTour Functions',
'   * Version: 1.0 (03.08.2015)',
'   * Author:  Daniel Hochleitner',
'   *-------------------------------------',
'  */',
'FUNCTION render_shepherdstarttour(p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                                  p_plugin         IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_dynamic_action_render_result IS',
'  --',
'  l_result apex_plugin.t_dynamic_action_render_result;',
'  --',
'BEGIN',
'  -- Debug',
'  IF apex_application.g_debug THEN',
'    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,',
'                                          p_dynamic_action => p_dynamic_action);',
'  END IF;',
'  -- Add JS Code to Start new Stepherd Instance',
'  --apex_javascript.add_inline_code(p_code => ''tour.start();'');',
'  apex_javascript.add_onload_code(p_code => ''tour.start();'');',
'  --',
'  l_result.javascript_function := ''function(){null}'';',
'  --',
'  RETURN l_result;',
'  --',
'END render_shepherdstarttour;'))
,p_render_function=>'render_shepherdstarttour'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Dynamic Action Plugin using OpenSource JS framework "Stepherd"',
'This framework includes 3 DA Plugins.',
'Use all 3 on the same page, action is for example "page load"',
'1) Shepherd (New Instance) - Creates a new Stepherd Instance/Tour - Here you can choose the look&feel template class / theme (use once per page)',
'2) Shepherd (Add Step) - This Plugin adds one Step of the tour. Here you can choose title, text und position of the popup. Attached to an element css class. (can be used multiple times per page)',
'3) Shepherd (Start Tour) - This plugin is the last, and starts the guided tour from step to step. (use once per page)',
'Original from: http://github.hubspot.com/shepherd/'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/Dani3lSun/apex-plugin-guidedtour'
,p_files_version=>24
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
