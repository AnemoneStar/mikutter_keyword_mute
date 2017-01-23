# -*- coding: utf-8 -*-

Plugin.create(:keyword_mute) do
    UserConfig[:keyword_mute_words] ||= []

    filter_show_filter do |msgs|
        msgs = msgs.select { |m| 
            not UserConfig[:keyword_mute_words].any?{ |word|
                word.gsub(/[ 　]+/,"") != "" and m.to_s.include?(word)
            }
        }
        [msgs]
    end

    settings "ワードミュート" do
        multi "ワード", :keyword_mute_words
    end
end
