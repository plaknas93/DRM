-- color-span.lua
-- Converts spans like [text]{.text-olive} into LaTeX commands for PDF output.

local function has_class(classes, c)
  for _, cls in ipairs(classes) do
    if cls == c then return true end
  end
  return false
end

function Span(el)
  if FORMAT:match('latex') then
    -- Use pandoc.utils.stringify to get textual content of the span
    local txt = pandoc.utils.stringify(el)
    if has_class(el.classes, 'text-olive') then
      return pandoc.RawInline('latex', '\\textolive{' .. txt .. '}')
    elseif has_class(el.classes, 'text-darkred') then
      return pandoc.RawInline('latex', '\\textdarkred{' .. txt .. '}')
    elseif has_class(el.classes, 'text-navy') then
      return pandoc.RawInline('latex', '\\textnavy{' .. txt .. '}')
    elseif has_class(el.classes, 'text-violet') then
      return pandoc.RawInline('latex', '\\textviolet{' .. txt .. '}')
    elseif has_class(el.classes, 'text-darkorange') then
      return pandoc.RawInline('latex', '\\textdarkorange{' .. txt .. '}')
    end
  end
  return el
end
