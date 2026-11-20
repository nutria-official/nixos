{ config, lib, ... }:

# https://docs.searxng.org/admin/settings/

{
  services.searx = {
    enable = true;
    openFirewall = true;
    redisCreateLocally = true;
    environmentFile = config.sops.secrets."searxng_secret_key".path;
    settings = {
      general = {
        debug = false;
        instance_name = "nutria search";
        donation_url = false;
        contact_url = false;
        privacypolicy_url = false;
        enable_metrics = false;
        wiki_url = false;
      };
      ui = {
        static_use_hash = true;
        default_locale = "";
        query_in_title = false;
        cache_url = "https://web.archive.org/web/";
        center_alignment = false;
        default_theme = "simple";
        theme_args.simple_style = "auto";
        results_on_new_tab = true;
        search_on_category_select = true;
        url_formatting = "pretty";
        hotkeys = "vim";
      };
      server = {
        port = 33478;
        bind_address = "0.0.0.0";
        default_locale = "";
        method = "GET";
        limiter = false;
        public_instance = false;
        image_proxy = true;
      };
      search = {
        safe_search = 0;
        autocomplete = "";
        favicon_resolver = "";
        default_lang = "";
        max_page = 0;
        suspended_times = {
          SearxEngineAccessDenied = 0;
          SearxEngineCaptcha = 0;
          SearxEngineTooManyRequests = 0;
          cf_SearxEngineCaptcha = 0;
          cf_SearxEngineAccessDenied = 0;
          recaptcha_SearxEngineCaptcha = 0;
        };
      };
      engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
        "searchmysite".disabled = true;
        "wiby".disabled = true;
        "openlibrary".disabled = true;
        "currency".disabled = true;
        "dictzone".disabled = true;
        "lingva".disabled = true;
        "mozhi".disabled = true;
        "mymemory translated".disabled = true;
        "bing".disabled = true;
        "brave".disabled = false;
        "duckduckgo".disabled = false;
        "google".disabled = true;
        "google cse".disabled = true;
        "qwant".disabled = true;
        "yahoo".disabled = true;
        "seznam".disabled = true;
        "naver".disabled = true;
        "wikibooks".disabled = true;
        "wikiquote".disabled = true;
        "wikisource".disabled = true;
        "wikispecies".disabled = true;
        "wikiversity".disabled = true;
        "wikivoyage".disabled = true;
        "ayo".disabled = true;
        "boardreader".disabled = true;
        "crowdview".disabled = true;
        "ddg definitions".disabled = true;
        "duckduckgo web".disabled = true;
        "encyclosearch".disabled = true;
        "fastbot".disabled = true;
        "fireball".disabled = true;
        "fynd".disabled = true;
        "gabanza".disabled = true;
        "gmx".disabled = true;
        "mwmbl".disabled = true;
        "privacywall".disabled = true;
        "resulthunter".disabled = true;
        "tineeye".disabled = true;
        "tusksearch".disabled = true;
        "vuhuv".disabled = true;
        "wikidata".disabled = true;
        "wikipedia".disabled = true;
        "wolframalpha".disabled = true;
        "yacy".disabled = true;
        "yandex".disabled = true;
        "yep".disabled = true;
        "zapmeta".disabled = true;
        "searchch".disabled = true;
        "bpb".disabled = true;
        "reloado".disabled = true;
        "wikimini".disabled = true;
        "abcnyheter".disabled = true;
        "360search".disabled = true;
        "baidu".disabled = true;
        "quark".disabled = true;
        "sogou".disabled = true;

        "radio browser".disabled = true;
      };
    };
  };
}
