module Accepted
  extend ActiveSupport::Concern




  def self.rates(membership:)
    uniqs = {}
    num = 0.0
    denom = 0.0
    last_a = nil

    membership.table.each do |r, i|
      a = r["aunits"]
      h = r["hunits"]

      unless a == nil
        unless last_a == nil
          uniqs[ last_a[0] ] = num.to_f / denom
          num = 0.0
          denom = 0.0
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
        uniqs[ last_a[0] ] = num.to_f / denom
      end
    end

    return uniqs
  end

  def self.rate(advisement:)
      
  end

  def self.calcRate(advisement:)
    all = Accepted.rates(membership: advisement.membership)
    accepted = all[advisement.date.strftime("%F")]

    return accepted
  end

  def self.col(membership:)
    col = []
    uniqs = Accepted.rates(membership: membership)
    cur_rate = 0.0
    membership.table.each_with_index do |r, i|
      p "rcdate"
      p r["cdate"]
      if uniqs[r["cdate"]]
        cur_rate = uniqs[r["cdate"]]
      end
      col.push( '%.2f' % (100 * cur_rate) )
    end
    return col
  end


end
