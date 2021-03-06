module EverydayNatsort
  class Accents
    MAPPINGS = [[%r{([\u00C0\u00C1\u00C2\u00C3\u00C4\u00C5\u0100\u0102\u0104])}, 'A'],
                [%r{([\u00E0\u00E1\u00E2\u00E3\u00E4\u00E5\u0101\u0103\u0105])}, 'a'],
                [%r{([\u00C6])}, 'AE'],
                [%r{([\u00E6])}, 'ae'],
                [%r{([\u00C7\u0106\u0108\u010A\u010C])}, 'C'],
                [%r{([\u00E7\u0107\u0109\u010B\u010D])}, 'c'],
                [%r{([\u010E\u0110])}, 'D'],
                [%r{([\u010F\u0111])}, 'd'],
                [%r{([\u00C8\u00C9\u00CA\u00CB\u0112\u0114\u0116\u0118\u011A])}, 'E'],
                [%r{([\u00E8\u00E9\u00EA\u00EB\u0113\u0115\u0117\u0119\u011B])}, 'e'],
                [%r{([\u011C\u011E\u0120\u0122])}, 'G'],
                [%r{([\u011D\u011F\u0121\u0123])}, 'g'],
                [%r{([\u0124\u0126])}, 'H'],
                [%r{([\u0125\u0127])}, 'h'],
                [%r{([\u00CC\u00CD\u00CE\u00CF\u0128\u012A\u012C\u012E\u0130])}, 'I'],
                [%r{([\u00EC\u00ED\u00EE\u00EF\u0129\u012B\u012D\u012F\u0131])}, 'i'],
                [%r{([\u0132])}, 'IJ'],
                [%r{([\u0133])}, 'ij'],
                [%r{([\u0134])}, 'J'],
                [%r{([\u0135])}, 'j'],
                [%r{([\u0136])}, 'K'],
                [%r{([\u0137])}, 'k'],
                [%r{([\u0139\u013B\u013D\u013F\u0141])}, 'L'],
                [%r{([\u013A\u013C\u013E\u0140\u0142])}, 'l'],
                [%r{([\u00D1\u0143\u0145\u0147\u014A])}, 'N'],
                [%r{([\u00F1\u0144\u0146\u0148\u0149\u014B])}, 'n'],
                [%r{([\u00D2\u00D3\u00D4\u00D5\u00D6\u00D8\u014C\u014E\u0150])}, 'O'],
                [%r{([\u00F2\u00F3\u00F4\u00F5\u00F6\u00F8\u014D\u014F\u0151])}, 'o'],
                [%r{([\u0152])}, 'OE'],
                [%r{([\u0153])}, 'oe'],
                [%r{([\u0154\u0156\u0158])}, 'R'],
                [%r{([\u0155\u0157\u0159])}, 'r'],
                [%r{([\u015A\u015C\u015E\u0160])}, 'S'],
                [%r{([\u015B\u015D\u015F\u0161])}, 's'],
                [%r{([\u0162\u0164\u0166])}, 'T'],
                [%r{([\u0163\u0165\u0167])}, 't'],
                [%r{([\u00D9\u00DA\u00DB\u00DC\u0168\u016A\u016C\u016E\u0170\u0172])}, 'U'],
                [%r{([\u00F9\u00FA\u00FB\u00FC\u0169\u016B\u016D\u016F\u0171\u0173])}, 'u'],
                [%r{([\u0174])}, 'W'],
                [%r{([\u0175])}, 'w'],
                [%r{([\u00D7])}, 'x'],
                [%r{([\u00DD\u0176\u0178])}, 'Y'],
                [%r{([\u00FD\u00FF\u0177])}, 'y'],
                [%r{([\u0179\u017B\u017D])}, 'Z'],
                [%r{([\u017A\u017C\u017E])}, 'z'],
                [%r{([\u201C\u201D])}, '"'],
                [%r{([\u00B4\u2018\u2019])}, "'"],
                [%r{([\u2010\u2011\u2012\u2013\u2014\u2015])}, '-']]
    class << self
      def sanitize(str)
        rval = str
        MAPPINGS.each { |v| rval = rval.gsub(v[0], v[1]) }
        rval
      end
    end
  end
end