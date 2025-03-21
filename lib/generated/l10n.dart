// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ChatBot`
  String get app_name {
    return Intl.message('ChatBot', name: 'app_name', desc: '', args: []);
  }

  /// `Chat`
  String get home_chat {
    return Intl.message('Chat', name: 'home_chat', desc: '', args: []);
  }

  /// `Voice Chat`
  String get voiceChat {
    return Intl.message('Voice Chat', name: 'voiceChat', desc: '', args: []);
  }

  /// `New Chat`
  String get new_chat {
    return Intl.message('New Chat', name: 'new_chat', desc: '', args: []);
  }

  /// `Multi chat room`
  String get group_chat {
    return Intl.message(
      'Multi chat room',
      name: 'group_chat',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get home_factory {
    return Intl.message('Library', name: 'home_factory', desc: '', args: []);
  }

  /// `Square`
  String get home_square {
    return Intl.message('Square', name: 'home_square', desc: '', args: []);
  }

  /// `Model`
  String get home_model {
    return Intl.message('Model', name: 'home_model', desc: '', args: []);
  }

  /// `Server`
  String get home_server {
    return Intl.message('Server', name: 'home_server', desc: '', args: []);
  }

  /// `My`
  String get home_my {
    return Intl.message('My', name: 'home_my', desc: '', args: []);
  }

  /// `Setting`
  String get home_setting {
    return Intl.message('Setting', name: 'home_setting', desc: '', args: []);
  }

  /// `ChatGPT Server`
  String get openai_setting {
    return Intl.message(
      'ChatGPT Server',
      name: 'openai_setting',
      desc: '',
      args: [],
    );
  }

  /// `Set the API key and API Server of ChatGPT`
  String get openai_setting_desc {
    return Intl.message(
      'Set the API key and API Server of ChatGPT',
      name: 'openai_setting_desc',
      desc: '',
      args: [],
    );
  }

  /// `Gemini Server`
  String get gemini_setting {
    return Intl.message(
      'Gemini Server',
      name: 'gemini_setting',
      desc: '',
      args: [],
    );
  }

  /// `Set the API key and API Server of Gemini`
  String get gemini_setting_desc {
    return Intl.message(
      'Set the API key and API Server of Gemini',
      name: 'gemini_setting_desc',
      desc: '',
      args: [],
    );
  }

  /// `Ollama Server`
  String get ollama_setting {
    return Intl.message(
      'Ollama Server',
      name: 'ollama_setting',
      desc: '',
      args: [],
    );
  }

  /// `Set the API Server of Ollama`
  String get ollama_setting_desc {
    return Intl.message(
      'Set the API Server of Ollama',
      name: 'ollama_setting_desc',
      desc: '',
      args: [],
    );
  }

  /// `Official`
  String get official {
    return Intl.message('Official', name: 'official', desc: '', args: []);
  }

  /// `Third`
  String get third_party {
    return Intl.message('Third', name: 'third_party', desc: '', args: []);
  }

  /// `Add`
  String get btn_add {
    return Intl.message('Add', name: 'btn_add', desc: '', args: []);
  }

  /// `Type server address`
  String get hint_addServerDesc {
    return Intl.message(
      'Type server address',
      name: 'hint_addServerDesc',
      desc: '',
      args: [],
    );
  }

  /// `recording...`
  String get recording {
    return Intl.message('recording...', name: 'recording', desc: '', args: []);
  }

  /// `canceling...`
  String get canceling {
    return Intl.message('canceling...', name: 'canceling', desc: '', args: []);
  }

  /// `Sending to server...`
  String get sending_server {
    return Intl.message(
      'Sending to server...',
      name: 'sending_server',
      desc: '',
      args: [],
    );
  }

  /// `The server is responding...`
  String get is_responsing {
    return Intl.message(
      'The server is responding...',
      name: 'is_responsing',
      desc: '',
      args: [],
    );
  }

  /// `Hold the bottom microphone to talk`
  String get hold_micro_phone_talk {
    return Intl.message(
      'Hold the bottom microphone to talk',
      name: 'hold_micro_phone_talk',
      desc: '',
      args: [],
    );
  }

  /// `The generated content is empty`
  String get generate_content_is_empty {
    return Intl.message(
      'The generated content is empty',
      name: 'generate_content_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Click on the upper right corner to add various paintings, digital people`
  String get chat_content_need_add {
    return Intl.message(
      'Click on the upper right corner to add various paintings, digital people',
      name: 'chat_content_need_add',
      desc: '',
      args: [],
    );
  }

  /// `No voice content recognized`
  String get can_not_get_voice_content {
    return Intl.message(
      'No voice content recognized',
      name: 'can_not_get_voice_content',
      desc: '',
      args: [],
    );
  }

  /// `No model available`
  String get no_module_use {
    return Intl.message(
      'No model available',
      name: 'no_module_use',
      desc: '',
      args: [],
    );
  }

  /// `Please enable recording permission`
  String get open_micro_permission {
    return Intl.message(
      'Please enable recording permission',
      name: 'open_micro_permission',
      desc: '',
      args: [],
    );
  }

  /// `Unable to obtain voice file`
  String get no_audio_file {
    return Intl.message(
      'Unable to obtain voice file',
      name: 'no_audio_file',
      desc: '',
      args: [],
    );
  }

  /// `Hold to speak`
  String get hold_talk {
    return Intl.message('Hold to speak', name: 'hold_talk', desc: '', args: []);
  }

  /// `Type text here`
  String get input_text {
    return Intl.message(
      'Type text here',
      name: 'input_text',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Send again`
  String get send_again {
    return Intl.message('Send again', name: 'send_again', desc: '', args: []);
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Copy success`
  String get copy_success {
    return Intl.message(
      'Copy success',
      name: 'copy_success',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Are you sure you want to delete this message?`
  String get delete_reminder {
    return Intl.message(
      'Are you sure you want to delete this message?',
      name: 'delete_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message('Reminder', name: 'reminder', desc: '', args: []);
  }

  /// `Are you sure you want to resend this message?`
  String get conform_resend {
    return Intl.message(
      'Are you sure you want to resend this message?',
      name: 'conform_resend',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Chat Setting`
  String get chat_setting {
    return Intl.message(
      'Chat Setting',
      name: 'chat_setting',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Please enter a name`
  String get input_name {
    return Intl.message(
      'Please enter a name',
      name: 'input_name',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get tempture {
    return Intl.message('Temperature', name: 'tempture', desc: '', args: []);
  }

  /// `Server`
  String get servers {
    return Intl.message('Server', name: 'servers', desc: '', args: []);
  }

  /// `Select`
  String get select {
    return Intl.message('Select', name: 'select', desc: '', args: []);
  }

  /// `Model`
  String get models {
    return Intl.message('Model', name: 'models', desc: '', args: []);
  }

  /// `Alias cannot be repeated`
  String get alias_repeat {
    return Intl.message(
      'Alias cannot be repeated',
      name: 'alias_repeat',
      desc: '',
      args: [],
    );
  }

  /// `API Key cannot be repeated`
  String get apikey_repeat {
    return Intl.message(
      'API Key cannot be repeated',
      name: 'apikey_repeat',
      desc: '',
      args: [],
    );
  }

  /// `Vivid`
  String get vivid {
    return Intl.message('Vivid', name: 'vivid', desc: '', args: []);
  }

  /// `Natural`
  String get natural {
    return Intl.message('Natural', name: 'natural', desc: '', args: []);
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Style`
  String get style {
    return Intl.message('Style', name: 'style', desc: '', args: []);
  }

  /// `Generate Image`
  String get generate_image {
    return Intl.message(
      'Generate Image',
      name: 'generate_image',
      desc: '',
      args: [],
    );
  }

  /// `Save to Gallery`
  String get save_gallary {
    return Intl.message(
      'Save to Gallery',
      name: 'save_gallary',
      desc: '',
      args: [],
    );
  }

  /// `Save success`
  String get save_success {
    return Intl.message(
      'Save success',
      name: 'save_success',
      desc: '',
      args: [],
    );
  }

  /// `Save fail`
  String get save_fail {
    return Intl.message('Save fail', name: 'save_fail', desc: '', args: []);
  }

  /// `Generate image fail`
  String get generate_image_fail {
    return Intl.message(
      'Generate image fail',
      name: 'generate_image_fail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the service first and configure the service provider`
  String get enter_setting_init_server {
    return Intl.message(
      'Please enter the service first and configure the service provider',
      name: 'enter_setting_init_server',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get yes_know {
    return Intl.message('Got it', name: 'yes_know', desc: '', args: []);
  }

  /// `Only support DALL-E 3`
  String get only_support_dalle3 {
    return Intl.message(
      'Only support DALL-E 3',
      name: 'only_support_dalle3',
      desc: '',
      args: [],
    );
  }

  /// `The current model does not support TTS`
  String get not_support_tts {
    return Intl.message(
      'The current model does not support TTS',
      name: 'not_support_tts',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get library {
    return Intl.message('Library', name: 'library', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Alias(required)`
  String get alias_required {
    return Intl.message(
      'Alias(required)',
      name: 'alias_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an alias`
  String get alias_input {
    return Intl.message(
      'Please enter an alias',
      name: 'alias_input',
      desc: '',
      args: [],
    );
  }

  /// `Alias is used to distinguish different models`
  String get alias_desc {
    return Intl.message(
      'Alias is used to distinguish different models',
      name: 'alias_desc',
      desc: '',
      args: [],
    );
  }

  /// `Validation success`
  String get validate_success {
    return Intl.message(
      'Validation success',
      name: 'validate_success',
      desc: '',
      args: [],
    );
  }

  /// `Validation fail`
  String get validate_fail {
    return Intl.message(
      'Validation fail',
      name: 'validate_fail',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this configuration?`
  String get delete_config_reminder {
    return Intl.message(
      'Are you sure you want to delete this configuration?',
      name: 'delete_config_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Validate`
  String get validate {
    return Intl.message('Validate', name: 'validate', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Alias cannot be empty`
  String get alias_empty {
    return Intl.message(
      'Alias cannot be empty',
      name: 'alias_empty',
      desc: '',
      args: [],
    );
  }

  /// `Alias cannot exceed 10 characters`
  String get alias_maxlength {
    return Intl.message(
      'Alias cannot exceed 10 characters',
      name: 'alias_maxlength',
      desc: '',
      args: [],
    );
  }

  /// `Cannot be empty`
  String get cannot_empty {
    return Intl.message(
      'Cannot be empty',
      name: 'cannot_empty',
      desc: '',
      args: [],
    );
  }

  /// `Getting models...`
  String get is_getting_modules {
    return Intl.message(
      'Getting models...',
      name: 'is_getting_modules',
      desc: '',
      args: [],
    );
  }

  /// `Failed to obtain the model. If you are sure that your Key can be used, please click Save directly.`
  String get getmodules_fail {
    return Intl.message(
      'Failed to obtain the model. If you are sure that your Key can be used, please click Save directly.',
      name: 'getmodules_fail',
      desc: '',
      args: [],
    );
  }

  /// `Organization(optional)`
  String get org_notrequired {
    return Intl.message(
      'Organization(optional)',
      name: 'org_notrequired',
      desc: '',
      args: [],
    );
  }

  /// `voice`
  String get canVoice {
    return Intl.message('voice', name: 'canVoice', desc: '', args: []);
  }

  /// `talk`
  String get canTalk {
    return Intl.message('talk', name: 'canTalk', desc: '', args: []);
  }

  /// `paint`
  String get canPaint {
    return Intl.message('paint', name: 'canPaint', desc: '', args: []);
  }

  /// `Other Settings`
  String get other_set {
    return Intl.message(
      'Other Settings',
      name: 'other_set',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get default1 {
    return Intl.message('Default', name: 'default1', desc: '', args: []);
  }

  /// `Auto Generate Title`
  String get auto_title {
    return Intl.message(
      'Auto Generate Title',
      name: 'auto_title',
      desc: '',
      args: [],
    );
  }

  /// `Has been reduced`
  String get has_reduce {
    return Intl.message(
      'Has been reduced',
      name: 'has_reduce',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Feedback`
  String get feedback {
    return Intl.message('Feedback', name: 'feedback', desc: '', args: []);
  }

  /// `Feedback`
  String get feedback_question {
    return Intl.message(
      'Feedback',
      name: 'feedback_question',
      desc: '',
      args: [],
    );
  }

  /// `Theme Setting`
  String get theme_setting {
    return Intl.message(
      'Theme Setting',
      name: 'theme_setting',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Light Mode`
  String get theme_normal {
    return Intl.message('Light Mode', name: 'theme_normal', desc: '', args: []);
  }

  /// `Dark Mode`
  String get theme_dark {
    return Intl.message('Dark Mode', name: 'theme_dark', desc: '', args: []);
  }

  /// `Follow System`
  String get theme_auto {
    return Intl.message(
      'Follow System',
      name: 'theme_auto',
      desc: '',
      args: [],
    );
  }

  /// `Downloading...`
  String get downloading {
    return Intl.message(
      'Downloading...',
      name: 'downloading',
      desc: '',
      args: [],
    );
  }

  /// `New version`
  String get new_version {
    return Intl.message('New version', name: 'new_version', desc: '', args: []);
  }

  /// `Update now`
  String get update_now {
    return Intl.message('Update now', name: 'update_now', desc: '', args: []);
  }

  /// `Use four to five words to directly return to the brief topic of this sentence. No explanations, no punctuation, no modal particles, no redundant text, and no bolding. If there is no topic, please directly return to "small talk"`
  String get title_promot {
    return Intl.message(
      'Use four to five words to directly return to the brief topic of this sentence. No explanations, no punctuation, no modal particles, no redundant text, and no bolding. If there is no topic, please directly return to "small talk"',
      name: 'title_promot',
      desc: '',
      args: [],
    );
  }

  /// `Leave Cancel`
  String get leave_cancel {
    return Intl.message(
      'Leave Cancel',
      name: 'leave_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Leave Send`
  String get leave_send {
    return Intl.message('Leave Send', name: 'leave_send', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// `The content is empty, please add content`
  String get empty_content_need_add {
    return Intl.message(
      'The content is empty, please add content',
      name: 'empty_content_need_add',
      desc: '',
      args: [],
    );
  }

  /// `Deacon`
  String get tts {
    return Intl.message('Deacon', name: 'tts', desc: '', args: []);
  }

  /// `Author`
  String get author {
    return Intl.message('Author', name: 'author', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Add AI Prompt`
  String get add_prompt {
    return Intl.message(
      'Add AI Prompt',
      name: 'add_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Please enter AI Prompt`
  String get prompt_hint {
    return Intl.message(
      'Please enter AI Prompt',
      name: 'prompt_hint',
      desc: '',
      args: [],
    );
  }

  /// `Example:Please help me create or optimize my resume based on the information I provided. The content produced and optimized must be centered around the information provided. The content must highlight personal highlights and characteristics, list past work experience in chronological order, quantify outstanding deeds and achievements at work through digitization and other methods, and the overall content It is required to be concise and easy to understand, with clear format and no grammatical errors。`
  String get prompt_demo {
    return Intl.message(
      'Example:Please help me create or optimize my resume based on the information I provided. The content produced and optimized must be centered around the information provided. The content must highlight personal highlights and characteristics, list past work experience in chronological order, quantify outstanding deeds and achievements at work through digitization and other methods, and the overall content It is required to be concise and easy to understand, with clear format and no grammatical errors。',
      name: 'prompt_demo',
      desc: '',
      args: [],
    );
  }

  /// `Greetings`
  String get prompt_greeting {
    return Intl.message(
      'Greetings',
      name: 'prompt_greeting',
      desc: '',
      args: [],
    );
  }

  /// `Example: To convey your experience and skills clearly and effectively, please provide me with the following information: 1. The position/industry or future goals you want to apply for; 2. Educational background, such as school, degree, major, honors received, etc.; 3 . Your past and present work/internship experience, such as position, professional and project experience and performance results, etc.; 4. Your skills, expertise, language ability and professional qualifications, etc.`
  String get prompt_greeting_demo {
    return Intl.message(
      'Example: To convey your experience and skills clearly and effectively, please provide me with the following information: 1. The position/industry or future goals you want to apply for; 2. Educational background, such as school, degree, major, honors received, etc.; 3 . Your past and present work/internship experience, such as position, professional and project experience and performance results, etc.; 4. Your skills, expertise, language ability and professional qualifications, etc.',
      name: 'prompt_greeting_demo',
      desc: '',
      args: [],
    );
  }

  /// `Text Parsing Model`
  String get text_parse_model {
    return Intl.message(
      'Text Parsing Model',
      name: 'text_parse_model',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `English`
  String get main_language {
    return Intl.message('English', name: 'main_language', desc: '', args: []);
  }

  /// `Translate`
  String get translate {
    return Intl.message('Translate', name: 'translate', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Function`
  String get function {
    return Intl.message('Function', name: 'function', desc: '', args: []);
  }

  /// `Screenshot`
  String get screenshot {
    return Intl.message('Screenshot', name: 'screenshot', desc: '', args: []);
  }

  /// `Share to`
  String get share_to {
    return Intl.message('Share to', name: 'share_to', desc: '', args: []);
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Primary Color`
  String get primary_color {
    return Intl.message(
      'Primary Color',
      name: 'primary_color',
      desc: '',
      args: [],
    );
  }

  /// `Recording time is too short`
  String get record_time_too_short {
    return Intl.message(
      'Recording time is too short',
      name: 'record_time_too_short',
      desc: '',
      args: [],
    );
  }

  /// `No model was obtained, and the system default model has been added to it.`
  String get set_default_models {
    return Intl.message(
      'No model was obtained, and the system default model has been added to it.',
      name: 'set_default_models',
      desc: '',
      args: [],
    );
  }

  /// `Pin`
  String get pin {
    return Intl.message('Pin', name: 'pin', desc: '', args: []);
  }

  /// `Unpin`
  String get unpin {
    return Intl.message('Unpin', name: 'unpin', desc: '', args: []);
  }

  /// `Download`
  String get download {
    return Intl.message('Download', name: 'download', desc: '', args: []);
  }

  /// `Download failed`
  String get download_fail {
    return Intl.message(
      'Download failed',
      name: 'download_fail',
      desc: '',
      args: [],
    );
  }

  /// `Download success`
  String get download_success {
    return Intl.message(
      'Download success',
      name: 'download_success',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Sync`
  String get sync {
    return Intl.message('Sync', name: 'sync', desc: '', args: []);
  }

  /// `Model`
  String get model {
    return Intl.message('Model', name: 'model', desc: '', args: []);
  }

  /// `Please type`
  String get please_input {
    return Intl.message(
      'Please type',
      name: 'please_input',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get custom {
    return Intl.message('Custom', name: 'custom', desc: '', args: []);
  }

  /// `Already Exists`
  String get has_exist {
    return Intl.message(
      'Already Exists',
      name: 'has_exist',
      desc: '',
      args: [],
    );
  }

  /// `Clear Context`
  String get clear_context {
    return Intl.message(
      'Clear Context',
      name: 'clear_context',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login {
    return Intl.message('Sign in', name: 'login', desc: '', args: []);
  }

  /// `Sign up`
  String get register {
    return Intl.message('Sign up', name: 'register', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forget_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get no_account {
    return Intl.message(
      'Don’t have an account? ',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Have an account`
  String get have_account {
    return Intl.message(
      'Have an account',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get phone {
    return Intl.message('phone number', name: 'phone', desc: '', args: []);
  }

  /// `password`
  String get pwd {
    return Intl.message('password', name: 'pwd', desc: '', args: []);
  }

  /// `verification code`
  String get vcode {
    return Intl.message('verification code', name: 'vcode', desc: '', args: []);
  }

  /// `confirm password`
  String get confirm_pwd {
    return Intl.message(
      'confirm password',
      name: 'confirm_pwd',
      desc: '',
      args: [],
    );
  }

  /// `password format error`
  String get pwd_format_error {
    return Intl.message(
      'password format error',
      name: 'pwd_format_error',
      desc: '',
      args: [],
    );
  }

  /// `password not same`
  String get pwd_not_same {
    return Intl.message(
      'password not same',
      name: 'pwd_not_same',
      desc: '',
      args: [],
    );
  }

  /// `sign in success`
  String get login_success {
    return Intl.message(
      'sign in success',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `sign up success`
  String get register_success {
    return Intl.message(
      'sign up success',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `true`
  String get true_ {
    return Intl.message('true', name: 'true_', desc: '', args: []);
  }

  /// `error`
  String get error_ {
    return Intl.message('error', name: 'error_', desc: '', args: []);
  }

  /// `error network`
  String get error_network {
    return Intl.message(
      'error network',
      name: 'error_network',
      desc: '',
      args: [],
    );
  }

  /// `error unknown`
  String get error_unknown {
    return Intl.message(
      'error unknown',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `error timeout`
  String get error_timeout {
    return Intl.message(
      'error timeout',
      name: 'error_timeout',
      desc: '',
      args: [],
    );
  }

  /// `error cancel`
  String get error_cancel {
    return Intl.message(
      'error cancel',
      name: 'error_cancel',
      desc: '',
      args: [],
    );
  }

  /// `error parse`
  String get error_parse {
    return Intl.message('error parse', name: 'error_parse', desc: '', args: []);
  }

  /// `error format`
  String get error_format {
    return Intl.message(
      'error format',
      name: 'error_format',
      desc: '',
      args: [],
    );
  }

  /// `error null`
  String get error_null {
    return Intl.message('error null', name: 'error_null', desc: '', args: []);
  }

  /// `error code`
  String get error_code {
    return Intl.message('error code', name: 'error_code', desc: '', args: []);
  }

  /// `error message`
  String get error_msg {
    return Intl.message('error message', name: 'error_msg', desc: '', args: []);
  }

  /// `error detail`
  String get error_detail {
    return Intl.message(
      'error detail',
      name: 'error_detail',
      desc: '',
      args: [],
    );
  }

  /// `Please check if the network is normal`
  String get error_detail_network_desc {
    return Intl.message(
      'Please check if the network is normal',
      name: 'error_detail_network_desc',
      desc: '',
      args: [],
    );
  }

  /// `If the problem persists, try restarting the app`
  String get error_detail_desc {
    return Intl.message(
      'If the problem persists, try restarting the app',
      name: 'error_detail_desc',
      desc: '',
      args: [],
    );
  }

  /// `Invitation Code`
  String get invitation_code {
    return Intl.message(
      'Invitation Code',
      name: 'invitation_code',
      desc: '',
      args: [],
    );
  }

  /// `Please enter invitation code`
  String get invitation_code_input {
    return Intl.message(
      'Please enter invitation code',
      name: 'invitation_code_input',
      desc: '',
      args: [],
    );
  }

  /// `Invitation code is required for registration`
  String get invitation_code_desc {
    return Intl.message(
      'Invitation code is required for registration',
      name: 'invitation_code_desc',
      desc: '',
      args: [],
    );
  }

  /// `Digital Man`
  String get digitalMan {
    return Intl.message('Digital Man', name: 'digitalMan', desc: '', args: []);
  }

  /// `Collect`
  String get collect {
    return Intl.message('Collect', name: 'collect', desc: '', args: []);
  }

  /// `retry`
  String get retry {
    return Intl.message('retry', name: 'retry', desc: '', args: []);
  }

  /// `no data to refresh`
  String get no_more_data {
    return Intl.message(
      'no data to refresh',
      name: 'no_more_data',
      desc: '',
      args: [],
    );
  }

  /// `switch`
  String get ju_switch {
    return Intl.message('switch', name: 'ju_switch', desc: '', args: []);
  }

  /// ` input`
  String get input {
    return Intl.message(' input', name: 'input', desc: '', args: []);
  }

  /// ` output`
  String get output {
    return Intl.message(' output', name: 'output', desc: '', args: []);
  }

  /// `maximum`
  String get maximum {
    return Intl.message('maximum', name: 'maximum', desc: '', args: []);
  }

  /// `least`
  String get least {
    return Intl.message('least', name: 'least', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `The maximum memory {context} context`
  String maxContext(Object context) {
    return Intl.message(
      'The maximum memory $context context',
      name: 'maxContext',
      desc: '',
      args: [context],
    );
  }

  /// `No limit, if the maximum input memory is exceeded, it will be automatically intercepted`
  String get maxContext_extend {
    return Intl.message(
      'No limit, if the maximum input memory is exceeded, it will be automatically intercepted',
      name: 'maxContext_extend',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
