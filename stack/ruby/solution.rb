#!/usr/bin/env ruby

require 'digest'

fail = []

File.open(ARGV[0], "r") do |fh|
    while(line = fh.gets) != nil
        data, hash = line.split(' ')
        check = Digest::MD5.hexdigest(data)
        if check != hash
            fail = fail.push("#{data} #{hash}")
        end
    end
end

puts fail
