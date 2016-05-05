module RecombeeApiClient
  # Errors in API
  class APIError < StandardError
  end

  # Response is not 200 or 201
  class ResponseError < APIError
    attr_reader :request
    attr_reader :status_code
    attr_reader :description

    def initialize(request, status_code, description)
      @status_code = status_code
      @description = description
    end

    def to_s
      "ResponseError: status: #{@status_code}, description: #{@description}"
    end
  end

  class UnknownOptionalParameter < StandardError
    def initialize(parameter)
      @parameter = parameter
    end

    def to_s
      "UnknownOptionalParameter: unknown parameter #{@parameter} was given to the request"
    end
  end

  class ApiTimeout < APIError
    attr_reader :request

    def initialize(request)
      @request = request
    end

    def to_s
      "ApiTimeout: client did not get response within #{@request.timeout} ms"
    end
  end

end
