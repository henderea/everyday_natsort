require_relative 'accents'

#Note: uses a modified version of the comparing logic from https://github.com/johnnyshields/naturalsort

module EverydayNatsort
  class Natural
    REGEXP = /(^|\D+)(\d+|(\D$))/
    NUMERIC = /(\d+)/

    class << self
      def sort(object)
        Array(object).sort do |a, b|
          self.compare(a, b)
        end
      end

      def compare(a, b)
        sa, sb = a.to_s, b.to_s
        if (sa.downcase <=> sb.downcase) == 0
          sa <=> sb
        else
          na, nb = nat_sanatize(sa, sb)
          na <=> nb
        end
      end

      def nat_sanatize(sa, sb)
        sa = EverydayNatsort::Accents.sanitize(sa).gsub('-', '_')
        sb = EverydayNatsort::Accents.sanitize(sb).gsub('-', '_')
        ma, mb = multireg(REGEXP, sa), multireg(REGEXP, sb)
        it     = 0
        equal  = 0
        ret    = ['', '']
        while (it < [ma.size, mb.size].min) and (equal==0)
          if (ma[it] and mb[it]) and (ma[it][1] and mb[it][1]) and (NUMERIC.match ma[it][0] and NUMERIC.match mb[it][0])
            l   = [ma[it][2].size, mb[it][2].size].max
            ret = [format(ma[it], l), format(mb[it], l)]
          else
            ret = [ma[it][0].downcase, mb[it][0].downcase]
          end
          equal = ret[0] <=> ret[1]
          it    +=1
        end
        return ret[0], ret[1]
      end

      # format([a, 1], 3) => a001
      # add leading zero
      def format(match_data, length)
        match_data[1].gsub(/-|_/, '').downcase + ("%0#{length}d" % match_data[2].to_i)
      end

      # return an array with
      # regexp matchdata on str
      def multireg(regpexp, str)
        result = []
        while regpexp.match(str)
          result.push regpexp.match(str)
          str = regpexp.match(str).post_match
        end
        result
      end
    end
  end
end