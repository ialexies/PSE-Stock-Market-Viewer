import 'dart:convert';

class Crypto {
  String? id;
  String? symbol;
  String? name;
  dynamic? assetPlatformId;
  Platforms? platforms;
  int? blockTimeInMinutes;
  String? hashingAlgorithm;
  List<String>? categories;
  dynamic? publicNotice;
  List<dynamic>? additionalNotices;
  Tion? localization;
  Tion? description;
  Links? links;
  Image? image;
  String? countryOrigin;
  DateTime? genesisDate;
  double? sentimentVotesUpPercentage;
  double? sentimentVotesDownPercentage;
  int? marketCapRank;
  int? coingeckoRank;
  double? coingeckoScore;
  double? developerScore;
  double? communityScore;
  double? liquidityScore;
  int? publicInterestScore;
  MarketData? marketData;
  CommunityData? communityData;
  DeveloperData? developerData;
  PublicInterestStats? publicInterestStats;
  List<dynamic>? statusUpdates;
  DateTime? lastUpdated;
  List<Ticker>? tickers;
  Crypto({
    this.id,
    this.symbol,
    this.name,
    this.assetPlatformId,
    this.platforms,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    this.publicNotice,
    this.additionalNotices,
    this.localization,
    this.description,
    this.links,
    this.image,
    this.countryOrigin,
    this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.marketCapRank,
    this.coingeckoRank,
    this.coingeckoScore,
    this.developerScore,
    this.communityScore,
    this.liquidityScore,
    this.publicInterestScore,
    this.marketData,
    this.communityData,
    this.developerData,
    this.publicInterestStats,
    this.statusUpdates,
    this.lastUpdated,
    this.tickers,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (symbol != null) {
      result.addAll({'symbol': symbol});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (assetPlatformId != null) {
      result.addAll({'assetPlatformId': assetPlatformId});
    }
    if (platforms != null) {
      result.addAll({'platforms': platforms!.toMap()});
    }
    if (blockTimeInMinutes != null) {
      result.addAll({'blockTimeInMinutes': blockTimeInMinutes});
    }
    if (hashingAlgorithm != null) {
      result.addAll({'hashingAlgorithm': hashingAlgorithm});
    }
    if (categories != null) {
      result.addAll({'categories': categories});
    }
    if (publicNotice != null) {
      result.addAll({'publicNotice': publicNotice});
    }
    if (additionalNotices != null) {
      result.addAll({'additionalNotices': additionalNotices});
    }
    if (localization != null) {
      result.addAll({'localization': localization!.toMap()});
    }
    if (description != null) {
      result.addAll({'description': description!.toMap()});
    }
    if (links != null) {
      result.addAll({'links': links!.toMap()});
    }
    if (image != null) {
      result.addAll({'image': image!.toMap()});
    }
    if (countryOrigin != null) {
      result.addAll({'countryOrigin': countryOrigin});
    }
    if (genesisDate != null) {
      result.addAll({'genesisDate': genesisDate!.millisecondsSinceEpoch});
    }
    if (sentimentVotesUpPercentage != null) {
      result.addAll({'sentimentVotesUpPercentage': sentimentVotesUpPercentage});
    }
    if (sentimentVotesDownPercentage != null) {
      result.addAll(
          {'sentimentVotesDownPercentage': sentimentVotesDownPercentage});
    }
    if (marketCapRank != null) {
      result.addAll({'marketCapRank': marketCapRank});
    }
    if (coingeckoRank != null) {
      result.addAll({'coingeckoRank': coingeckoRank});
    }
    if (coingeckoScore != null) {
      result.addAll({'coingeckoScore': coingeckoScore});
    }
    if (developerScore != null) {
      result.addAll({'developerScore': developerScore});
    }
    if (communityScore != null) {
      result.addAll({'communityScore': communityScore});
    }
    if (liquidityScore != null) {
      result.addAll({'liquidityScore': liquidityScore});
    }
    if (publicInterestScore != null) {
      result.addAll({'publicInterestScore': publicInterestScore});
    }
    if (marketData != null) {
      result.addAll({'marketData': marketData!.toMap()});
    }
    if (communityData != null) {
      result.addAll({'communityData': communityData!.toMap()});
    }
    if (developerData != null) {
      result.addAll({'developerData': developerData!.toMap()});
    }
    if (publicInterestStats != null) {
      result.addAll({'publicInterestStats': publicInterestStats!.toMap()});
    }
    if (statusUpdates != null) {
      result.addAll({'statusUpdates': statusUpdates});
    }
    if (lastUpdated != null) {
      result.addAll({'lastUpdated': lastUpdated!.millisecondsSinceEpoch});
    }
    if (tickers != null) {
      result.addAll({'tickers': tickers!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory Crypto.fromMap(Map<String, dynamic> map) {
    return Crypto(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      assetPlatformId: map['assetPlatformId'],
      platforms:
          map['platforms'] != null ? Platforms.fromMap(map['platforms']) : null,
      blockTimeInMinutes: map['blockTimeInMinutes']?.toInt(),
      hashingAlgorithm: map['hashingAlgorithm'],
      categories: List<String>.from(map['categories']),
      publicNotice: map['publicNotice'],
      // additionalNotices: List<dynamic>.from(map['additionalNotices']),
      localization: map['localization'] != null
          ? Tion.fromMap(map['localization'])
          : null,
      description: Tion.fromMap(map['description']),
      links: map['links'] != null ? Links.fromMap(map['links']) : null,
      image: map['image'] != null ? Image.fromMap(map['image']) : null,
      countryOrigin: map['countryOrigin'],
      genesisDate: map['genesisDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['genesisDate'])
          : null,
      sentimentVotesUpPercentage: map['sentimentVotesUpPercentage']?.toDouble(),
      sentimentVotesDownPercentage:
          map['sentimentVotesDownPercentage']?.toDouble(),
      marketCapRank: map['marketCapRank']?.toInt(),
      coingeckoRank: map['coingeckoRank']?.toInt(),
      coingeckoScore: map['coingeckoScore']?.toDouble(),
      developerScore: map['developerScore']?.toDouble(),
      communityScore: map['communityScore']?.toDouble(),
      liquidityScore: map['liquidityScore']?.toDouble(),
      publicInterestScore: map['publicInterestScore']?.toInt(),
      marketData: map['marketData'] != null
          ? MarketData.fromMap(map['marketData'])
          : null,
      communityData: map['communityData'] != null
          ? CommunityData.fromMap(map['communityData'])
          : null,
      developerData: map['developerData'] != null
          ? DeveloperData.fromMap(map['developerData'])
          : null,
      publicInterestStats: map['publicInterestStats'] != null
          ? PublicInterestStats.fromMap(map['publicInterestStats'])
          : null,
      // statusUpdates: List<dynamic>.from(map['statusUpdates']),
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'])
          : null,
      tickers: map['tickers'] != null
          ? List<Ticker>.from(map['tickers']?.map((x) => Ticker.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Crypto.fromJson(String source) => Crypto.fromMap(json.decode(source));

  factory Crypto.fromJson(String source) => Crypto.fromMap(json.decode(source));
}

class CommunityData {
  dynamic? facebookLikes;
  int? twitterFollowers;
  double? redditAveragePosts48H;
  double? redditAverageComments48H;
  int? redditSubscribers;
  int? redditAccountsActive48H;
  dynamic telegramChannelUserCount;
  CommunityData({
    this.facebookLikes,
    this.twitterFollowers,
    this.redditAveragePosts48H,
    this.redditAverageComments48H,
    this.redditSubscribers,
    this.redditAccountsActive48H,
    required this.telegramChannelUserCount,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (facebookLikes != null) {
      result.addAll({'facebookLikes': facebookLikes});
    }
    if (twitterFollowers != null) {
      result.addAll({'twitterFollowers': twitterFollowers});
    }
    if (redditAveragePosts48H != null) {
      result.addAll({'redditAveragePosts48H': redditAveragePosts48H});
    }
    if (redditAverageComments48H != null) {
      result.addAll({'redditAverageComments48H': redditAverageComments48H});
    }
    if (redditSubscribers != null) {
      result.addAll({'redditSubscribers': redditSubscribers});
    }
    if (redditAccountsActive48H != null) {
      result.addAll({'redditAccountsActive48H': redditAccountsActive48H});
    }
    result.addAll({'telegramChannelUserCount': telegramChannelUserCount});

    return result;
  }

  factory CommunityData.fromMap(Map<String, dynamic> map) {
    return CommunityData(
      facebookLikes: map['facebookLikes'],
      twitterFollowers: map['twitterFollowers']?.toInt(),
      redditAveragePosts48H: map['redditAveragePosts48H']?.toDouble(),
      redditAverageComments48H: map['redditAverageComments48H']?.toDouble(),
      redditSubscribers: map['redditSubscribers']?.toInt(),
      redditAccountsActive48H: map['redditAccountsActive48H']?.toInt(),
      telegramChannelUserCount: map['telegramChannelUserCount'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommunityData.fromJson(String source) =>
      CommunityData.fromMap(json.decode(source));
}

class Tion {
  String? en;
  String? de;
  String? es;
  String? fr;
  String? it;
  String? pl;
  String? ro;
  String? hu;
  String? nl;
  String? pt;
  String? sv;
  String? vi;
  String? tr;
  String? ru;
  String? ja;
  String? zh;
  String? zhTw;
  String? ko;
  String? ar;
  String? th;
  String? id;
  String? cs;
  String? da;
  String? el;
  String? hi;
  String? no;
  String? sk;
  String? uk;
  String? he;
  String? fi;
  String? bg;
  String? hr;
  String? lt;
  String? sl;
  Tion({
    this.en,
    this.de,
    this.es,
    this.fr,
    this.it,
    this.pl,
    this.ro,
    this.hu,
    this.nl,
    this.pt,
    this.sv,
    this.vi,
    this.tr,
    this.ru,
    this.ja,
    this.zh,
    this.zhTw,
    this.ko,
    this.ar,
    this.th,
    this.id,
    this.cs,
    this.da,
    this.el,
    this.hi,
    this.no,
    this.sk,
    this.uk,
    this.he,
    this.fi,
    this.bg,
    this.hr,
    this.lt,
    this.sl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (en != null) {
      result.addAll({'en': en});
    }
    if (de != null) {
      result.addAll({'de': de});
    }
    if (es != null) {
      result.addAll({'es': es});
    }
    if (fr != null) {
      result.addAll({'fr': fr});
    }
    if (it != null) {
      result.addAll({'it': it});
    }
    if (pl != null) {
      result.addAll({'pl': pl});
    }
    if (ro != null) {
      result.addAll({'ro': ro});
    }
    if (hu != null) {
      result.addAll({'hu': hu});
    }
    if (nl != null) {
      result.addAll({'nl': nl});
    }
    if (pt != null) {
      result.addAll({'pt': pt});
    }
    if (sv != null) {
      result.addAll({'sv': sv});
    }
    if (vi != null) {
      result.addAll({'vi': vi});
    }
    if (tr != null) {
      result.addAll({'tr': tr});
    }
    if (ru != null) {
      result.addAll({'ru': ru});
    }
    if (ja != null) {
      result.addAll({'ja': ja});
    }
    if (zh != null) {
      result.addAll({'zh': zh});
    }
    if (zhTw != null) {
      result.addAll({'zhTw': zhTw});
    }
    if (ko != null) {
      result.addAll({'ko': ko});
    }
    if (ar != null) {
      result.addAll({'ar': ar});
    }
    if (th != null) {
      result.addAll({'th': th});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (cs != null) {
      result.addAll({'cs': cs});
    }
    if (da != null) {
      result.addAll({'da': da});
    }
    if (el != null) {
      result.addAll({'el': el});
    }
    if (hi != null) {
      result.addAll({'hi': hi});
    }
    if (no != null) {
      result.addAll({'no': no});
    }
    if (sk != null) {
      result.addAll({'sk': sk});
    }
    if (uk != null) {
      result.addAll({'uk': uk});
    }
    if (he != null) {
      result.addAll({'he': he});
    }
    if (fi != null) {
      result.addAll({'fi': fi});
    }
    if (bg != null) {
      result.addAll({'bg': bg});
    }
    if (hr != null) {
      result.addAll({'hr': hr});
    }
    if (lt != null) {
      result.addAll({'lt': lt});
    }
    if (sl != null) {
      result.addAll({'sl': sl});
    }

    return result;
  }

  factory Tion.fromMap(Map<String, dynamic> map) {
    return Tion(
      en: map['en'],
      de: map['de'],
      es: map['es'],
      fr: map['fr'],
      it: map['it'],
      pl: map['pl'],
      ro: map['ro'],
      hu: map['hu'],
      nl: map['nl'],
      pt: map['pt'],
      sv: map['sv'],
      vi: map['vi'],
      tr: map['tr'],
      ru: map['ru'],
      ja: map['ja'],
      zh: map['zh'],
      zhTw: map['zhTw'],
      ko: map['ko'],
      ar: map['ar'],
      th: map['th'],
      id: map['id'],
      cs: map['cs'],
      da: map['da'],
      el: map['el'],
      hi: map['hi'],
      no: map['no'],
      sk: map['sk'],
      uk: map['uk'],
      he: map['he'],
      fi: map['fi'],
      bg: map['bg'],
      hr: map['hr'],
      lt: map['lt'],
      sl: map['sl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tion.fromJson(String source) => Tion.fromMap(json.decode(source));
}

class DeveloperData {
  int? forks;
  int? stars;
  int? subscribers;
  int? totalIssues;
  int? closedIssues;
  int? pullRequestsMerged;
  int? pullRequestContributors;
  CodeAdditionsDeletions4Weeks? codeAdditionsDeletions4Weeks;
  int? commitCount4Weeks;
  List<int>? last4WeeksCommitActivitySeries;
  DeveloperData({
    this.forks,
    this.stars,
    this.subscribers,
    this.totalIssues,
    this.closedIssues,
    this.pullRequestsMerged,
    this.pullRequestContributors,
    this.codeAdditionsDeletions4Weeks,
    this.commitCount4Weeks,
    this.last4WeeksCommitActivitySeries,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (forks != null) {
      result.addAll({'forks': forks});
    }
    if (stars != null) {
      result.addAll({'stars': stars});
    }
    if (subscribers != null) {
      result.addAll({'subscribers': subscribers});
    }
    if (totalIssues != null) {
      result.addAll({'totalIssues': totalIssues});
    }
    if (closedIssues != null) {
      result.addAll({'closedIssues': closedIssues});
    }
    if (pullRequestsMerged != null) {
      result.addAll({'pullRequestsMerged': pullRequestsMerged});
    }
    if (pullRequestContributors != null) {
      result.addAll({'pullRequestContributors': pullRequestContributors});
    }
    if (codeAdditionsDeletions4Weeks != null) {
      result.addAll({
        'codeAdditionsDeletions4Weeks': codeAdditionsDeletions4Weeks!.toMap()
      });
    }
    if (commitCount4Weeks != null) {
      result.addAll({'commitCount4Weeks': commitCount4Weeks});
    }
    if (last4WeeksCommitActivitySeries != null) {
      result.addAll(
          {'last4WeeksCommitActivitySeries': last4WeeksCommitActivitySeries});
    }

    return result;
  }

  factory DeveloperData.fromMap(Map<String, dynamic> map) {
    return DeveloperData(
      forks: map['forks']?.toInt(),
      stars: map['stars']?.toInt(),
      subscribers: map['subscribers']?.toInt(),
      totalIssues: map['totalIssues']?.toInt(),
      closedIssues: map['closedIssues']?.toInt(),
      pullRequestsMerged: map['pullRequestsMerged']?.toInt(),
      pullRequestContributors: map['pullRequestContributors']?.toInt(),
      codeAdditionsDeletions4Weeks: map['codeAdditionsDeletions4Weeks'] != null
          ? CodeAdditionsDeletions4Weeks.fromMap(
              map['codeAdditionsDeletions4Weeks'])
          : null,
      commitCount4Weeks: map['commitCount4Weeks']?.toInt(),
      last4WeeksCommitActivitySeries:
          List<int>.from(map['last4WeeksCommitActivitySeries']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeveloperData.fromJson(String source) =>
      DeveloperData.fromMap(json.decode(source));
}

class CodeAdditionsDeletions4Weeks {
  int? additions;
  int? deletions;
  CodeAdditionsDeletions4Weeks({
    this.additions,
    this.deletions,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (additions != null) {
      result.addAll({'additions': additions});
    }
    if (deletions != null) {
      result.addAll({'deletions': deletions});
    }

    return result;
  }

  factory CodeAdditionsDeletions4Weeks.fromMap(Map<String, dynamic> map) {
    return CodeAdditionsDeletions4Weeks(
      additions: map['additions']?.toInt(),
      deletions: map['deletions']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeAdditionsDeletions4Weeks.fromJson(String source) =>
      CodeAdditionsDeletions4Weeks.fromMap(json.decode(source));
}

enum Id { BITCOIN, TETHER, BINANCE_USD, TRUE_USD, USD_COIN }

class Image {
  String? thumb;
  String? small;
  String? large;
  Image({
    this.thumb,
    this.small,
    this.large,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (thumb != null) {
      result.addAll({'thumb': thumb});
    }
    if (small != null) {
      result.addAll({'small': small});
    }
    if (large != null) {
      result.addAll({'large': large});
    }

    return result;
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      thumb: map['thumb'],
      small: map['small'],
      large: map['large'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));
}

class Links {
  List<String>? homepage;
  List<String>? blockchainSite;
  List<String>? officialForumUrl;
  List<String>? chatUrl;
  List<String>? announcementUrl;
  Id? twitterScreenName;
  String? facebookUsername;
  dynamic? bitcointalkThreadIdentifier;
  String? telegramChannelIdentifier;
  String? subredditUrl;
  ReposUrl? reposUrl;
  Links({
    this.homepage,
    this.blockchainSite,
    this.officialForumUrl,
    this.chatUrl,
    this.announcementUrl,
    this.twitterScreenName,
    this.facebookUsername,
    this.bitcointalkThreadIdentifier,
    this.telegramChannelIdentifier,
    this.subredditUrl,
    this.reposUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (homepage != null) {
      result.addAll({'homepage': homepage});
    }
    if (blockchainSite != null) {
      result.addAll({'blockchainSite': blockchainSite});
    }
    if (officialForumUrl != null) {
      result.addAll({'officialForumUrl': officialForumUrl});
    }
    if (chatUrl != null) {
      result.addAll({'chatUrl': chatUrl});
    }
    if (announcementUrl != null) {
      result.addAll({'announcementUrl': announcementUrl});
    }
    // if (twitterScreenName != null) {
    //   result.addAll({'twitterScreenName': twitterScreenName!.toMap()});
    // }
    if (facebookUsername != null) {
      result.addAll({'facebookUsername': facebookUsername});
    }
    if (bitcointalkThreadIdentifier != null) {
      result
          .addAll({'bitcointalkThreadIdentifier': bitcointalkThreadIdentifier});
    }
    if (telegramChannelIdentifier != null) {
      result.addAll({'telegramChannelIdentifier': telegramChannelIdentifier});
    }
    if (subredditUrl != null) {
      result.addAll({'subredditUrl': subredditUrl});
    }
    if (reposUrl != null) {
      result.addAll({'reposUrl': reposUrl!.toMap()});
    }

    return result;
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      homepage: List<String>.from(map['homepage']),
      // blockchainSite: List<String>.from(map['blockchainSite']),
      // officialForumUrl: List<String>.from(map['officialForumUrl']),
      // chatUrl: List<String>.from(map['chatUrl']),
      // announcementUrl: List<String>.from(map['announcementUrl']),
      // twitterScreenName: map['twitterScreenName'] != null
      //     ? Id.fromMap(map['twitterScreenName'])
      //     : null,
      facebookUsername: map['facebookUsername'],
      bitcointalkThreadIdentifier: map['bitcointalkThreadIdentifier'],
      telegramChannelIdentifier: map['telegramChannelIdentifier'],
      subredditUrl: map['subredditUrl'],
      reposUrl:
          map['reposUrl'] != null ? ReposUrl.fromMap(map['reposUrl']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));
}

class ReposUrl {
  List<String>? github;
  List<dynamic>? bitbucket;
  ReposUrl({
    this.github,
    this.bitbucket,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (github != null) {
      result.addAll({'github': github});
    }
    if (bitbucket != null) {
      result.addAll({'bitbucket': bitbucket});
    }

    return result;
  }

  factory ReposUrl.fromMap(Map<String, dynamic> map) {
    return ReposUrl(
      github: List<String>.from(map['github']),
      bitbucket: List<dynamic>.from(map['bitbucket']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReposUrl.fromJson(String source) =>
      ReposUrl.fromMap(json.decode(source));
}

class MarketData {
  Map<String, double>? currentPrice;
  dynamic totalValueLocked;
  dynamic mcapToTvlRatio;
  dynamic fdvToTvlRatio;
  dynamic roi;
  Map<String, double>? ath;
  Map<String, double>? athChangePercentage;
  Map<String, DateTime>? athDate;
  Map<String, double>? atl;
  Map<String, double>? atlChangePercentage;
  Map<String, DateTime>? atlDate;
  Map<String, double>? marketCap;
  int? marketCapRank;
  Map<String, double>? fullyDilutedValuation;
  Map<String, double>? totalVolume;
  Map<String, double>? high24H;
  Map<String, double>? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? priceChangePercentage7D;
  double? priceChangePercentage14D;
  double? priceChangePercentage30D;
  double? priceChangePercentage60D;
  double? priceChangePercentage200D;
  double? priceChangePercentage1Y;
  int? marketCapChange24H;
  double? marketCapChangePercentage24H;
  Map<String, double>? priceChange24HInCurrency;
  Map<String, double>? priceChangePercentage1HInCurrency;
  Map<String, double>? priceChangePercentage24HInCurrency;
  Map<String, double>? priceChangePercentage7DInCurrency;
  Map<String, double>? priceChangePercentage14DInCurrency;
  Map<String, double>? priceChangePercentage30DInCurrency;
  Map<String, double>? priceChangePercentage60DInCurrency;
  Map<String, double>? priceChangePercentage200DInCurrency;
  Map<String, double>? priceChangePercentage1YInCurrency;
  Map<String, double>? marketCapChange24HInCurrency;
  Map<String, double>? marketCapChangePercentage24HInCurrency;
  int? totalSupply;
  int? maxSupply;
  int? circulatingSupply;
  DateTime? lastUpdated;
  MarketData({
    this.currentPrice,
    required this.totalValueLocked,
    required this.mcapToTvlRatio,
    required this.fdvToTvlRatio,
    required this.roi,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.priceChangePercentage7D,
    this.priceChangePercentage14D,
    this.priceChangePercentage30D,
    this.priceChangePercentage60D,
    this.priceChangePercentage200D,
    this.priceChangePercentage1Y,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.priceChange24HInCurrency,
    this.priceChangePercentage1HInCurrency,
    this.priceChangePercentage24HInCurrency,
    this.priceChangePercentage7DInCurrency,
    this.priceChangePercentage14DInCurrency,
    this.priceChangePercentage30DInCurrency,
    this.priceChangePercentage60DInCurrency,
    this.priceChangePercentage200DInCurrency,
    this.priceChangePercentage1YInCurrency,
    this.marketCapChange24HInCurrency,
    this.marketCapChangePercentage24HInCurrency,
    this.totalSupply,
    this.maxSupply,
    this.circulatingSupply,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (currentPrice != null) {
      result.addAll({'currentPrice': currentPrice});
    }
    result.addAll({'totalValueLocked': totalValueLocked});
    result.addAll({'mcapToTvlRatio': mcapToTvlRatio});
    result.addAll({'fdvToTvlRatio': fdvToTvlRatio});
    result.addAll({'roi': roi});
    if (ath != null) {
      result.addAll({'ath': ath});
    }
    if (athChangePercentage != null) {
      result.addAll({'athChangePercentage': athChangePercentage});
    }
    if (athDate != null) {
      result.addAll({'athDate': athDate});
    }
    if (atl != null) {
      result.addAll({'atl': atl});
    }
    if (atlChangePercentage != null) {
      result.addAll({'atlChangePercentage': atlChangePercentage});
    }
    if (atlDate != null) {
      result.addAll({'atlDate': atlDate});
    }
    if (marketCap != null) {
      result.addAll({'marketCap': marketCap});
    }
    if (marketCapRank != null) {
      result.addAll({'marketCapRank': marketCapRank});
    }
    if (fullyDilutedValuation != null) {
      result.addAll({'fullyDilutedValuation': fullyDilutedValuation});
    }
    if (totalVolume != null) {
      result.addAll({'totalVolume': totalVolume});
    }
    if (high24H != null) {
      result.addAll({'high24H': high24H});
    }
    if (low24H != null) {
      result.addAll({'low24H': low24H});
    }
    if (priceChange24H != null) {
      result.addAll({'priceChange24H': priceChange24H});
    }
    if (priceChangePercentage24H != null) {
      result.addAll({'priceChangePercentage24H': priceChangePercentage24H});
    }
    if (priceChangePercentage7D != null) {
      result.addAll({'priceChangePercentage7D': priceChangePercentage7D});
    }
    if (priceChangePercentage14D != null) {
      result.addAll({'priceChangePercentage14D': priceChangePercentage14D});
    }
    if (priceChangePercentage30D != null) {
      result.addAll({'priceChangePercentage30D': priceChangePercentage30D});
    }
    if (priceChangePercentage60D != null) {
      result.addAll({'priceChangePercentage60D': priceChangePercentage60D});
    }
    if (priceChangePercentage200D != null) {
      result.addAll({'priceChangePercentage200D': priceChangePercentage200D});
    }
    if (priceChangePercentage1Y != null) {
      result.addAll({'priceChangePercentage1Y': priceChangePercentage1Y});
    }
    if (marketCapChange24H != null) {
      result.addAll({'marketCapChange24H': marketCapChange24H});
    }
    if (marketCapChangePercentage24H != null) {
      result.addAll(
          {'marketCapChangePercentage24H': marketCapChangePercentage24H});
    }
    if (priceChange24HInCurrency != null) {
      result.addAll({'priceChange24HInCurrency': priceChange24HInCurrency});
    }
    if (priceChangePercentage1HInCurrency != null) {
      result.addAll({
        'priceChangePercentage1HInCurrency': priceChangePercentage1HInCurrency
      });
    }
    if (priceChangePercentage24HInCurrency != null) {
      result.addAll({
        'priceChangePercentage24HInCurrency': priceChangePercentage24HInCurrency
      });
    }
    if (priceChangePercentage7DInCurrency != null) {
      result.addAll({
        'priceChangePercentage7DInCurrency': priceChangePercentage7DInCurrency
      });
    }
    if (priceChangePercentage14DInCurrency != null) {
      result.addAll({
        'priceChangePercentage14DInCurrency': priceChangePercentage14DInCurrency
      });
    }
    if (priceChangePercentage30DInCurrency != null) {
      result.addAll({
        'priceChangePercentage30DInCurrency': priceChangePercentage30DInCurrency
      });
    }
    if (priceChangePercentage60DInCurrency != null) {
      result.addAll({
        'priceChangePercentage60DInCurrency': priceChangePercentage60DInCurrency
      });
    }
    if (priceChangePercentage200DInCurrency != null) {
      result.addAll({
        'priceChangePercentage200DInCurrency':
            priceChangePercentage200DInCurrency
      });
    }
    if (priceChangePercentage1YInCurrency != null) {
      result.addAll({
        'priceChangePercentage1YInCurrency': priceChangePercentage1YInCurrency
      });
    }
    if (marketCapChange24HInCurrency != null) {
      result.addAll(
          {'marketCapChange24HInCurrency': marketCapChange24HInCurrency});
    }
    if (marketCapChangePercentage24HInCurrency != null) {
      result.addAll({
        'marketCapChangePercentage24HInCurrency':
            marketCapChangePercentage24HInCurrency
      });
    }
    if (totalSupply != null) {
      result.addAll({'totalSupply': totalSupply});
    }
    if (maxSupply != null) {
      result.addAll({'maxSupply': maxSupply});
    }
    if (circulatingSupply != null) {
      result.addAll({'circulatingSupply': circulatingSupply});
    }
    if (lastUpdated != null) {
      result.addAll({'lastUpdated': lastUpdated!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory MarketData.fromMap(Map<String, dynamic> map) {
    return MarketData(
      currentPrice: Map<String, double>.from(map['currentPrice']),
      totalValueLocked: map['totalValueLocked'] ?? null,
      mcapToTvlRatio: map['mcapToTvlRatio'] ?? null,
      fdvToTvlRatio: map['fdvToTvlRatio'] ?? null,
      roi: map['roi'] ?? null,
      ath: Map<String, double>.from(map['ath']),
      athChangePercentage: Map<String, double>.from(map['athChangePercentage']),
      athDate: Map<String, DateTime>.from(map['athDate']),
      atl: Map<String, double>.from(map['atl']),
      atlChangePercentage: Map<String, double>.from(map['atlChangePercentage']),
      atlDate: Map<String, DateTime>.from(map['atlDate']),
      marketCap: Map<String, double>.from(map['marketCap']),
      marketCapRank: map['marketCapRank']?.toInt(),
      fullyDilutedValuation:
          Map<String, double>.from(map['fullyDilutedValuation']),
      totalVolume: Map<String, double>.from(map['totalVolume']),
      high24H: Map<String, double>.from(map['high24H']),
      low24H: Map<String, double>.from(map['low24H']),
      priceChange24H: map['priceChange24H']?.toDouble(),
      priceChangePercentage24H: map['priceChangePercentage24H']?.toDouble(),
      priceChangePercentage7D: map['priceChangePercentage7D']?.toDouble(),
      priceChangePercentage14D: map['priceChangePercentage14D']?.toDouble(),
      priceChangePercentage30D: map['priceChangePercentage30D']?.toDouble(),
      priceChangePercentage60D: map['priceChangePercentage60D']?.toDouble(),
      priceChangePercentage200D: map['priceChangePercentage200D']?.toDouble(),
      priceChangePercentage1Y: map['priceChangePercentage1Y']?.toDouble(),
      marketCapChange24H: map['marketCapChange24H']?.toInt(),
      marketCapChangePercentage24H:
          map['marketCapChangePercentage24H']?.toDouble(),
      priceChange24HInCurrency:
          Map<String, double>.from(map['priceChange24HInCurrency']),
      priceChangePercentage1HInCurrency:
          Map<String, double>.from(map['priceChangePercentage1HInCurrency']),
      priceChangePercentage24HInCurrency:
          Map<String, double>.from(map['priceChangePercentage24HInCurrency']),
      priceChangePercentage7DInCurrency:
          Map<String, double>.from(map['priceChangePercentage7DInCurrency']),
      priceChangePercentage14DInCurrency:
          Map<String, double>.from(map['priceChangePercentage14DInCurrency']),
      priceChangePercentage30DInCurrency:
          Map<String, double>.from(map['priceChangePercentage30DInCurrency']),
      priceChangePercentage60DInCurrency:
          Map<String, double>.from(map['priceChangePercentage60DInCurrency']),
      priceChangePercentage200DInCurrency:
          Map<String, double>.from(map['priceChangePercentage200DInCurrency']),
      priceChangePercentage1YInCurrency:
          Map<String, double>.from(map['priceChangePercentage1YInCurrency']),
      marketCapChange24HInCurrency:
          Map<String, double>.from(map['marketCapChange24HInCurrency']),
      marketCapChangePercentage24HInCurrency: Map<String, double>.from(
          map['marketCapChangePercentage24HInCurrency']),
      totalSupply: map['totalSupply']?.toInt(),
      maxSupply: map['maxSupply']?.toInt(),
      circulatingSupply: map['circulatingSupply']?.toInt(),
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketData.fromJson(String source) =>
      MarketData.fromMap(json.decode(source));
}

class Platforms {
  // Platforms({
  //   this.empty,
  // });

  String? empty;
  Platforms({
    this.empty,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (empty != null) {
      result.addAll({'empty': empty});
    }

    return result;
  }

  factory Platforms.fromMap(Map<String, dynamic> map) {
    return Platforms(
      empty: map['empty'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Platforms.fromJson(String source) =>
      Platforms.fromMap(json.decode(source));
}

class PublicInterestStats {
  int? alexaRank;
  dynamic bingMatches;
  PublicInterestStats({
    this.alexaRank,
    required this.bingMatches,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (alexaRank != null) {
      result.addAll({'alexaRank': alexaRank});
    }
    result.addAll({'bingMatches': bingMatches});

    return result;
  }

  factory PublicInterestStats.fromMap(Map<String, dynamic> map) {
    return PublicInterestStats(
      alexaRank: map['alexaRank']?.toInt(),
      bingMatches: map['bingMatches'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicInterestStats.fromJson(String source) =>
      PublicInterestStats.fromMap(json.decode(source));
}

class Ticker {
  String? base;
  // Target? target;
  Market? market;
  double? last;
  double? volume;
  Map<String, double>? convertedLast;
  Map<String, double>? convertedVolume;
  // TrustScore? trustScore;
  double? bidAskSpreadPercentage;
  DateTime? timestamp;
  DateTime? lastTradedAt;
  DateTime? lastFetchAt;
  bool? isAnomaly;
  bool? isStale;
  String? tradeUrl;
  dynamic tokenInfoUrl;
  String? coinId;
  Id? targetCoinId;
  Ticker({
    this.base,
    // this.target,
    this.market,
    this.last,
    this.volume,
    this.convertedLast,
    this.convertedVolume,
    // this.trustScore,
    this.bidAskSpreadPercentage,
    this.timestamp,
    this.lastTradedAt,
    this.lastFetchAt,
    this.isAnomaly,
    this.isStale,
    this.tradeUrl,
    required this.tokenInfoUrl,
    this.coinId,
    this.targetCoinId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (base != null) {
      result.addAll({'base': base});
    }
    // if (target != null) {
    //   result.addAll({'target': target!.toMap()});
    // }
    if (market != null) {
      result.addAll({'market': market!.toMap()});
    }
    if (last != null) {
      result.addAll({'last': last});
    }
    if (volume != null) {
      result.addAll({'volume': volume});
    }
    if (convertedLast != null) {
      result.addAll({'convertedLast': convertedLast});
    }
    if (convertedVolume != null) {
      result.addAll({'convertedVolume': convertedVolume});
    }
    // if (trustScore != null) {
    //   result.addAll({'trustScore': trustScore!.toMap()});
    // }
    if (bidAskSpreadPercentage != null) {
      result.addAll({'bidAskSpreadPercentage': bidAskSpreadPercentage});
    }
    if (timestamp != null) {
      result.addAll({'timestamp': timestamp!.millisecondsSinceEpoch});
    }
    if (lastTradedAt != null) {
      result.addAll({'lastTradedAt': lastTradedAt!.millisecondsSinceEpoch});
    }
    if (lastFetchAt != null) {
      result.addAll({'lastFetchAt': lastFetchAt!.millisecondsSinceEpoch});
    }
    if (isAnomaly != null) {
      result.addAll({'isAnomaly': isAnomaly});
    }
    if (isStale != null) {
      result.addAll({'isStale': isStale});
    }
    if (tradeUrl != null) {
      result.addAll({'tradeUrl': tradeUrl});
    }
    result.addAll({'tokenInfoUrl': tokenInfoUrl});
    if (coinId != null) {
      result.addAll({'coinId': coinId});
    }
    // if (targetCoinId != null) {
    //   result.addAll({'targetCoinId': targetCoinId!.toMap()});
    // }

    return result;
  }

  factory Ticker.fromMap(Map<String, dynamic> map) {
    return Ticker(
      base: map['base'],
      // target: map['target'] != null ? Target.fromMap(map['target']) : null,
      market: map['market'] != null ? Market.fromMap(map['market']) : null,
      last: map['last']?.toDouble(),
      volume: map['volume']?.toDouble(),
      // convertedLast: Map<String, double>.from(map['convertedLast']),
      convertedVolume: Map<String, double>.from(map['convertedVolume']),
      // trustScore: map['trustScore'] != null
      //     ? TrustScore.fromMap(map['trustScore'])
      //     : null,
      bidAskSpreadPercentage: map['bidAskSpreadPercentage']?.toDouble(),
      timestamp: map['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'])
          : null,
      lastTradedAt: map['lastTradedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastTradedAt'])
          : null,
      lastFetchAt: map['lastFetchAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastFetchAt'])
          : null,
      isAnomaly: map['isAnomaly'],
      isStale: map['isStale'],
      tradeUrl: map['tradeUrl'],
      tokenInfoUrl: map['tokenInfoUrl'] ?? null,
      coinId: map['coinId'],
      // targetCoinId:
      //     map['targetCoinId'] != null ? Id.fromMap(map['targetCoinId']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticker.fromJson(String source) => Ticker.fromMap(json.decode(source));
}

class Market {
  String? name;
  String? identifier;
  bool? hasTradingIncentive;
  Market({
    this.name,
    this.identifier,
    this.hasTradingIncentive,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (identifier != null) {
      result.addAll({'identifier': identifier});
    }
    if (hasTradingIncentive != null) {
      result.addAll({'hasTradingIncentive': hasTradingIncentive});
    }

    return result;
  }

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(
      name: map['name'],
      identifier: map['identifier'],
      hasTradingIncentive: map['hasTradingIncentive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Market.fromJson(String source) => Market.fromMap(json.decode(source));
}

// enum Target { BTC, USDT, USD, JPY, EUR, BUSD, UST, TUSD, USDC }

// enum TrustScore { GREEN }
