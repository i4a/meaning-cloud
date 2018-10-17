module MeaningCloud
  # A class to hold all topic extraction related code.
  class Topics
    def self.extract_topics(options = nil)
      fail(Exception, 'Missing key') if MeaningCloud.configuration.key.nil?

      options ||= {}

      options = {
        of: :json,
        key: MeaningCloud.configuration.key,
        lang: MeaningCloud.configuration.language,
        tt: MeaningCloud.configuration.topic_types,
        ud: MeaningCloud.configuration.user_dictionary,
        uw: 'y'
      }.merge(options)

      query = URI.encode_www_form(options)

      result = RestClient.post("#{API_BASE}?#{query}", {})
      JSON.parse(result)
    end
  end
end
