module Sentimo
  
  #Defines errors raised by methods of the SentiMo Ruby SDK.
  class SentiMoError < StandardError;  
  end
  
  #Defines error raised by HTTP related methods of the SentiMo Ruby SDK.
  class SentiMoHTTPError < SentiMoError;
  end
  
  #Defines errors raised when you attempt an operation using an invalid SentiMo API key
  class SentiMoAuthenticationError < SentiMoError;
  end
end