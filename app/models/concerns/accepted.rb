module Accepted
  extend ActiveSupport::Concern
  def self.rate(table:)
    uniqs = {}
    num = 0
    denom = 0
    last_a = nil

    table.each do |r, i|
      a = r["aunits"]
      h = r["hunits"]

      unless a == nil

        unless last_a == nil
          uniqs[ last_a[0] ] = num / denom
          num = 0
          denom = 0
        end

        last_a = [ r["cdate"], a ]
      end

      unless h == nil or last_a == nil

        if h == last_a[1]
          num += 1
        end

        denom += 1
      end
    end

    unless last_a == nil
      if uniqs[ last_a[0] ] == nil
        uniqs[ last_a[0] ] = num / denom
      end
    end

    return uniqs
  end
end
