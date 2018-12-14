set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>1672352206259312
,p_default_application_id=>1000
,p_default_owner=>'RD_DEV'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/de_danielh_gt_addstep
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(12383306263377601364)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'DE.DANIELH.GT.ADDSTEP'
,p_display_name=>'GuidedTour (Add Step)'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * GuidedTour Functions',
' * Version: 1.0.2 (20.08.2018)',
' * Author:  Daniel Hochleitner',
' * Customized by Ronny Weiß',
' *-------------------------------------',
'*/',
'FUNCTION render_shepherdaddstep(p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                                p_plugin         IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_dynamic_action_render_result IS',
'  --',
'  l_step_name       APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_01%TYPE := p_dynamic_action.attribute_01;',
'  l_step_title      APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_02%TYPE := p_dynamic_action.attribute_02;',
'  l_step_text       APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_03%TYPE := p_dynamic_action.attribute_03;',
'  l_attach_to_class APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_04%TYPE := p_dynamic_action.attribute_04;',
'  l_btn_close_text  APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_05%TYPE := p_dynamic_action.attribute_05;',
'  l_btn_next_text   APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_06%TYPE := p_dynamic_action.attribute_06;',
'  l_position        APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_07%TYPE := p_dynamic_action.attribute_07;',
'  l_escape_html     APEX_APPLICATION_PAGE_REGIONS.ATTRIBUTE_08%TYPE := p_dynamic_action.attribute_08;',
'  --',
'  l_result apex_plugin.t_dynamic_action_render_result;',
'  --',
'BEGIN',
'  -- Debug',
'  IF apex_application.g_debug THEN',
'    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,',
'                                          p_dynamic_action => p_dynamic_action);',
'  END IF;',
'  -- Escaping',
'  if l_escape_html != ''false'' then',
'    l_step_name      := apex_escape.html(l_step_name);',
'    l_step_title     := apex_escape.html(l_step_title);',
'    l_step_text      := apex_escape.html(l_step_text);',
'    l_btn_close_text := apex_escape.html(l_btn_close_text);',
'    l_btn_next_text  := apex_escape.html(l_btn_next_text);',
'  end if;',
' ',
'  l_step_title     := apex_escape.json(l_step_title);',
'  l_step_text      := apex_escape.json(l_step_text);',
'  l_btn_close_text := apex_escape.json(l_btn_close_text);',
'  l_btn_next_text  := apex_escape.json(l_btn_next_text);',
' ',
'  -- Add JS Code to Start new Stepherd Instance',
'  apex_javascript.add_inline_code(p_code => ''tour.addStep("'' || l_step_name ||',
'                                            ''", {title: "'' || l_step_title ||',
'                                            ''",text: "'' || l_step_text ||',
'                                            ''",attachTo: "'' ||',
'                                            l_attach_to_class || '' '' ||',
'                                            l_position ||',
'                                            ''",buttons: [{text: "'' ||',
'                                            l_btn_close_text ||',
'                                            ''",classes: "shepherd-button-secondary",action: function() {return tour.hide();}},{text: "'' ||',
'                                            l_btn_next_text ||',
'                                            ''",action: tour.next,classes: "shepherd-button-example-primary"}]});'');',
'   l_result.javascript_function := ''function(){null}'';',
'   l_result.attribute_01        := l_step_name;',
'   l_result.attribute_02        := l_step_title;',
'   l_result.attribute_03        := l_step_text;',
'   l_result.attribute_04        := l_attach_to_class;',
'   l_result.attribute_05        := l_btn_close_text;',
'   l_result.attribute_06        := l_btn_next_text;',
'   l_result.attribute_06        := l_position;',
'',
'  RETURN l_result;',
'  --',
'END render_shepherdaddstep;'))
,p_api_version=>1
,p_render_function=>'render_shepherdaddstep'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Dynamic Action Plugin using OpenSource JS framework "Stepherd"',
'This framework includes 3 DA Plugins.',
'Use all 3 on the same page, action is for example "page load"',
'1) Shepherd (New Instance) - Creates a new Stepherd Instance/Tour - Here you can choose the look&feel template class / theme (use once per page)',
'2) Shepherd (Add Step) - This Plugin adds one Step of the tour. Here you can choose title, text und position of the popup. Attached to an element css class. (can be used multiple times per page)',
'3) Shepherd (Start Tour) - This plugin is the last, and starts the guided tour from step to step. (use once per page)',
'Original from: http://github.hubspot.com/shepherd/'))
,p_version_identifier=>'1.0.2.'
,p_about_url=>'https://github.com/Dani3lSun/apex-plugin-guidedtour'
,p_files_version=>24
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12383306499259601368)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Step Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Step1'
,p_max_length=>100
,p_is_translatable=>true
,p_help_text=>'Give the step an name. this value would not be displayed.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12383306812765601369)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Step Title'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Title1'
,p_max_length=>100
,p_is_translatable=>true
,p_help_text=>'Visible title of the step.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12383307291365601370)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Step Text'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_max_length=>1000
,p_is_translatable=>true
,p_help_text=>'Visible Text of the step.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12383307662594601370)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Attach to CSS class'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_max_length=>200
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'attached to item: #P100_ITEM_NAME',
'attached to menu bar: .t-NavigationBar-item',
'attached to report card: .t-Card'))
,p_help_text=>'css class the "popup" would be attached to.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12383308073528601370)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Button Close Text'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Close'
,p_max_length=>10
,p_is_translatable=>true
,p_help_text=>'Text/Label of the close button.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12383308406533601371)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Button Next Text'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Next'
,p_max_length=>10
,p_is_translatable=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Text/Label of the next button.',
'For last step, the label could be "done" instead of "next."'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(12383308894723601371)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'bottom'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Position of the popup. Choose between top/bottom/left/right.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12383309263770601371)
,p_plugin_attribute_id=>wwv_flow_api.id(12383308894723601371)
,p_display_sequence=>10
,p_display_value=>'Bottom'
,p_return_value=>'bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12383309742427601373)
,p_plugin_attribute_id=>wwv_flow_api.id(12383308894723601371)
,p_display_sequence=>20
,p_display_value=>'Top'
,p_return_value=>'top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12383310282064601373)
,p_plugin_attribute_id=>wwv_flow_api.id(12383308894723601371)
,p_display_sequence=>30
,p_display_value=>'Left'
,p_return_value=>'left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(12383310772023601374)
,p_plugin_attribute_id=>wwv_flow_api.id(12383308894723601371)
,p_display_sequence=>40
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1298418744152990893)
,p_plugin_id=>wwv_flow_api.id(12383306263377601364)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Escape HTML'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'true'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Used to set if output is escaped or not.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1298427484324992699)
,p_plugin_attribute_id=>wwv_flow_api.id(1298418744152990893)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1298427879044993344)
,p_plugin_attribute_id=>wwv_flow_api.id(1298418744152990893)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'false'
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
