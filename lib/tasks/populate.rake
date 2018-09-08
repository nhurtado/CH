require 'httparty'
require 'rubygems'
require 'json'

desc 'populate db'
task :pop_uf => :environment do
  url = 'https://mindicador.cl/api/uf/'
  ys = [*1984..2018]
  current_date = Date.parse("1984-01-01")
  ys.each do |y|
    urly = "#{url}#{y}"
    response = HTTParty.get(urly)
    rJ = JSON.parse(response.body)
    rS = rJ['serie'].reverse
    rS.each do |array|
      d = DateTime.parse(array['fecha'])
      d_n = Date.parse("#{d.year}-#{d.month}-#{d.day}")
      while d_n > current_date
        aux_uf = Uf.where(date_v: current_date-1).first
	ua = Uf.create(date_v: current_date,value: aux_uf.value)
        current_date = current_date + 1
      end
      if !Uf.where(date_v: d_n).exists?
        ub = Uf.create(date_v: d_n,value: array['valor'])
        current_date = current_date + 1
      end
    end
    puts y
  end
end

desc 'populate db'
task :pop_usd => :environment do
  url = 'https://mindicador.cl/api/dolar/'
  ys = [*1984..2018]
  current_date = Date.parse("1984-01-01")
  Usd.create(date_v: current_date,value: 87.54)
  ys.each do |y|
    urly = "#{url}#{y}"
    response = HTTParty.get(urly)
    rJ = JSON.parse(response.body)
    rS = rJ['serie'].reverse
    rS.each do |array|
      d = DateTime.parse(array['fecha'])
      d_n = Date.parse("#{d.year}-#{d.month}-#{d.day}")
      while d_n > current_date
        aux_date = current_date-1
  	if Usd.where(date_v: aux_date).exists?
          aux_usd = Usd.where(date_v: aux_date).first
	  Usd.create(date_v: current_date,value: aux_usd.value)
        end
        current_date = current_date + 1
      end
      Usd.create(date_v: current_date, value: array['valor'])
      current_date = current_date + 1
    end
    puts y
  end
end

desc 'list_ufs'
task :list_uf => :environment do
  puts Uf.all.count
end

desc 'list_ufs'
task :list_usd => :environment do
  puts Usd.all.count
end

desc 'comp'
task :comp => :environment do
  us = Uf.all
  us.each do |u|
    if !Usd.where(date_v: u.date_v).exists?
      puts u.date_v.to_s
    end
  end
end

desc 'delete ufs'
task :delete_uf => :environment do
  Uf.delete_all
end

desc 'delete ufs'
task :delete_usd => :environment do
  Usd.delete_all
end


