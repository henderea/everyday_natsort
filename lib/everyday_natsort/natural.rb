require_relative 'accents'

#Note: uses a modified version of the comparing logic from https://github.com/johnnyshields/naturalsort

module EverydayNatsort
  class Natural
    REGEXP  = /(^|\D+)(\d+|(\D$))/
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
        sa     = EverydayNatsort::Accents.sanitize(sa).gsub('-', '_')
        sb     = EverydayNatsort::Accents.sanitize(sb).gsub('-', '_')
        ma, mb = multireg(REGEXP, sa), multireg(REGEXP, sb)
        ret    = sanatize_loop(ma, mb)
        return ret[0], ret[1]
      end

      def sanatize_loop(ma, mb)
        ret   = ['', '']
        (0...[ma.size, mb.size].min).each { |it|
          ret = process_match(it, ma, mb)
          break unless check_equal(ret)
        }
        ret
      end

      def process_match(it, ma, mb)
        match_num?(it, ma, mb) ? process_numeric_match(it, ma, mb) : process_alpha_match(it, ma, mb)
      end

      def match_num?(it, ma, mb)
        both_exist?(it, ma, mb) && both_have_group_1?(it, ma, mb) && both_num?(it, ma, mb)
      end

      def both_exist?(it, ma, mb)
        ma[it] && mb[it]
      end

      def both_have_group_1?(it, ma, mb)
        ma[it][1] && mb[it][1]
      end

      def both_num?(it, ma, mb)
        num?(ma[it][0]) && num?(mb[it][0])
      end

      def process_numeric_match(it, ma, mb)
        l = [ma[it][2].size, mb[it][2].size].max
        [format(ma[it], l), format(mb[it], l)]
      end

      def process_alpha_match(it, ma, mb)
        [ma[it][0].downcase, mb[it][0].downcase]
      end

      def num?(v)
        NUMERIC.match(v)
      end

      def check_equal(ret)
        (ret[0] <=> ret[1]) == 0
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