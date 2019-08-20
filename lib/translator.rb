require "yaml"

def load_library(file_path)
  translator_dict = {"get_meaning" => {}, "get_emoticon" => {}}
  b = YAML.load_file(file_path)
  b.each_pair do |meaning,emojis|
    translator_dict["get_meaning"][emojis[1]] = meaning
    translator_dict["get_emoticon"][emojis[0]] = emojis[1]
  end
  translator_dict
end

def get_japanese_emoticon(file_path, eng_emoji)
  trans_dict = load_library(file_path)
  if trans_dict["get_emoticon"].has_key?(eng_emoji)
    return trans_dict["get_emoticon"][eng_emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path,jap_emoji)
  trans_dict = load_library(file_path)
  result = trans_dict['get_meaning'][jap_emoji]
  result ? result : "Sorry, that emoticon was not found"
end


# x = get_japanese_emoticon('./emoticons.yml',"O:)")
# p x
