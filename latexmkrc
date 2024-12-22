my $toggles = '';

if ($ENV{RTW_PRINTABLE}) {
  $toggles .= '\toggletrue{printable}';
}
if ($ENV{RTW_NO_ART_BACKGROUND}) {
  $toggles .= '\toggletrue{noartbackground}';
}
if ($ENV{RTW_GITHUB_BUILD}) {
  $toggles .= '\toggletrue{githubbuild}'
}

if ($toggles) {
  &alt_tex_cmds;
  $pre_tex_code = '\AtBeginDocument{'.$toggles.'}';
}

if ($ENV{RTW_PRINTABLE}) {
  my $lang = $ENV{HOMM3_LANG};
  $makeindex = "bash -c 'upmendex -s <(cat index_style.ist; echo icu_locale \"$lang\") -o %D %S'";
}
