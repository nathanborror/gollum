# stdlib
require 'digest/md5'

# external
require 'grit'
require 'github/markup'
require 'sanitize'

# internal
require 'gollum/pagination'
require 'gollum/wiki'
require 'gollum/page'
require 'gollum/file'
require 'gollum/markup'
require 'gollum/albino'

module Gollum
  VERSION = '1.0.0'

  SANITIZATION_OPTIONS = {
    :elements => [
      'a', 'abbr', 'acronym', 'address', 'area', 'b', 'big',
      'blockquote', 'br', 'button', 'caption', 'center', 'cite',
      'code', 'col', 'colgroup', 'dd', 'del', 'dfn', 'dir',
      'div', 'dl', 'dt', 'em', 'fieldset', 'font', 'form', 'h1',
      'h2', 'h3', 'h4', 'h5', 'h6', 'hr', 'i', 'img', 'input',
      'ins', 'kbd', 'label', 'legend', 'li', 'map', 'menu',
      'ol', 'optgroup', 'option', 'p', 'pre', 'q', 's', 'samp',
      'select', 'small', 'span', 'strike', 'strong', 'sub',
      'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th',
      'thead', 'tr', 'tt', 'u', 'ul', 'var'
    ],
    :attributes => {
      :all => ['abbr', 'accept', 'accept-charset',
               'accesskey', 'action', 'align', 'alt', 'axis',
               'border', 'cellpadding', 'cellspacing', 'char',
               'charoff', 'charset', 'checked', 'cite',
               'class', 'clear', 'cols', 'colspan', 'color',
               'compact', 'coords', 'datetime', 'dir',
               'disabled', 'enctype', 'for', 'frame',
               'headers', 'height', 'href', 'hreflang',
               'hspace', 'id', 'ismap', 'label', 'lang',
               'longdesc', 'maxlength', 'media', 'method',
               'multiple', 'name', 'nohref', 'noshade',
               'nowrap', 'prompt', 'readonly', 'rel', 'rev',
               'rows', 'rowspan', 'rules', 'scope',
               'selected', 'shape', 'size', 'span', 'src',
               'start', 'summary', 'tabindex', 'target',
               'title', 'type', 'usemap', 'valign', 'value',
               'vspace', 'width']
    },
    :protocols => {
      'a' => {'href' => ['http', 'https', 'mailto', :relative]},
      'img' => {'href' => ['http', 'https', :relative]}
    }
  }
end

