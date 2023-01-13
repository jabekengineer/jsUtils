function configureCmdWindow(varargin)
    %CONFIGURECMDWINDOW  Customize command window
    %   formats {string}: desired numeric format long, shortE, shortG, rational
    %   lineSpacing {string}: spacing between lines
    %   defaultPageSize {scalar}: how many lines you want for your more call
    %   See also: inputParser, format, more
    %   Jason Sebek 2023
    
    formats = {'long', 'short', 'shortE',...
    'longE', 'shortG', 'shortEng', 'longEng',...
    '+', 'bank', 'hex', 'rational'};
    lineSpacings = {'compact', 'loose'};
    defaultFormat = 'shortE';
    defaultSpacing = 'compact';
    defaultPageSize = 5;

    p = inputParser;
    validScalarPosNum = @(x) isnumeric(x) && isscalar(x) && (x>0);
    addOptional(p, 'format', defaultFormat, @(x) any(validatestring(x,formats)))
    addOptional(p, 'lineSpacing', defaultSpacing,...
         @(x) any(validatestring(x,lineSpacings)));
    addOptional(p, 'pageSize', defaultPageSize, validScalarPosNum);
    parse(p, varargin{:});
    format(p.Results.format); 
    format(p.Results.lineSpacing); 
    more(p.Results.pageSize);

end