module Unchained

  # TODO: Support more errors.
  class Error < StandardError; end
  class NotFound < Error; end
  class InvalidValue < Error; end
  class InvalidAttribute < Error; end

end
