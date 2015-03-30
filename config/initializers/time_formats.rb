date_formats = {
  us_short_date: '%b %d %Y' # 13-Jan-2014
}

Time::DATE_FORMATS.merge! date_formats
Date::DATE_FORMATS.merge! date_formats