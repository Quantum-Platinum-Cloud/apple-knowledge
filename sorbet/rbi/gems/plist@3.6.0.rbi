# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `plist` gem.
# Please instead update this file by running `bin/tapioca gem plist`.

# source://plist-3.6.0/lib/plist/generator.rb:174
class Array
  include ::Enumerable
  include ::Plist::Emit
end

# source://plist-3.6.0/lib/plist/generator.rb:178
class Hash
  include ::Enumerable
  include ::Plist::Emit
end

# Plist parses Mac OS X xml property list files into ruby data structures.
#
# === Load a plist file
# This is the main point of the library:
#
#   r = Plist.parse_xml(filename_or_xml)
#
# source://plist-3.6.0/lib/plist/generator.rb:9
module Plist
  class << self
    # Note that I don't use these two elements much:
    #
    #  + Date elements are returned as DateTime objects.
    #  + Data elements are implemented as Tempfiles
    #
    # Plist.parse_xml will blow up if it encounters a Date element.
    # If you encounter such an error, or if you have a Date element which
    # can't be parsed into a Time object, please create an issue
    # attaching your plist file at https://github.com/patsplat/plist/issues
    # so folks can implement the proper support.
    #
    # source://plist-3.6.0/lib/plist/parser.rb:29
    def parse_xml(filename_or_xml); end
  end
end

# === Create a plist
# You can dump an object to a plist in one of two ways:
#
# * <tt>Plist::Emit.dump(obj)</tt>
# * <tt>obj.to_plist</tt>
#   * This requires that you mixin the <tt>Plist::Emit</tt> module, which is already done for +Array+ and +Hash+.
#
# The following Ruby classes are converted into native plist types:
#   Array, Bignum, Date, DateTime, Fixnum, Float, Hash, Integer, String, Symbol, Time, true, false
# * +Array+ and +Hash+ are both recursive; their elements will be converted into plist nodes inside the <array> and <dict> containers (respectively).
# * +IO+ (and its descendants) and +StringIO+ objects are read from and their contents placed in a <data> element.
# * User classes may implement +to_plist_node+ to dictate how they should be serialized; otherwise the object will be passed to <tt>Marshal.dump</tt> and the result placed in a <data> element.
#
# For detailed usage instructions, refer to USAGE[link:files/_docs/USAGE.html] and the methods documented below.
#
# source://plist-3.6.0/lib/plist/generator.rb:24
module Plist::Emit
  # Helper method for injecting into classes.  Calls <tt>Plist::Emit.save_plist</tt> with +self+.
  #
  # source://plist-3.6.0/lib/plist/generator.rb:33
  def save_plist(filename, options = T.unsafe(nil)); end

  # Helper method for injecting into classes.  Calls <tt>Plist::Emit.dump</tt> with +self+.
  #
  # source://plist-3.6.0/lib/plist/generator.rb:28
  def to_plist(envelope = T.unsafe(nil), options = T.unsafe(nil)); end

  class << self
    # The following Ruby classes are converted into native plist types:
    #   Array, Bignum, Date, DateTime, Fixnum, Float, Hash, Integer, String, Symbol, Time
    #
    # Write us (via RubyForge) if you think another class can be coerced safely into one of the expected plist classes.
    #
    # +IO+ and +StringIO+ objects are encoded and placed in <data> elements; other objects are <tt>Marshal.dump</tt>'ed unless they implement +to_plist_node+.
    #
    # The +envelope+ parameters dictates whether or not the resultant plist fragment is wrapped in the normal XML/plist header and footer.  Set it to false if you only want the fragment.
    #
    # source://plist-3.6.0/lib/plist/generator.rb:45
    def dump(obj, envelope = T.unsafe(nil), options = T.unsafe(nil)); end

    # Writes the serialized object's plist to the specified filename.
    #
    # source://plist-3.6.0/lib/plist/generator.rb:55
    def save_plist(obj, filename, options = T.unsafe(nil)); end

    # source://plist-3.6.0/lib/plist/generator.rb:162
    def wrap(contents); end
  end
end

# source://plist-3.6.0/lib/plist/generator.rb:25
Plist::Emit::DEFAULT_INDENT = T.let(T.unsafe(nil), String)

# source://plist-3.6.0/lib/plist/generator.rb:63
class Plist::Emit::PlistBuilder
  # @return [PlistBuilder] a new instance of PlistBuilder
  #
  # source://plist-3.6.0/lib/plist/generator.rb:64
  def initialize(indent_str); end

  # source://plist-3.6.0/lib/plist/generator.rb:68
  def build(element, level = T.unsafe(nil)); end

  private

  # source://plist-3.6.0/lib/plist/generator.rb:157
  def comment_tag(content); end

  # source://plist-3.6.0/lib/plist/generator.rb:125
  def data_tag(data, level); end

  # source://plist-3.6.0/lib/plist/generator.rb:144
  def element_type(item); end

  # source://plist-3.6.0/lib/plist/generator.rb:140
  def indent(str, level); end

  # source://plist-3.6.0/lib/plist/generator.rb:113
  def tag(type, contents, level, &block); end
end

# source://plist-3.6.0/lib/plist/parser.rb:37
class Plist::Listener
  # @return [Listener] a new instance of Listener
  #
  # source://plist-3.6.0/lib/plist/parser.rb:42
  def initialize; end

  # include REXML::StreamListener
  #
  # source://plist-3.6.0/lib/plist/parser.rb:40
  def open; end

  # include REXML::StreamListener
  #
  # source://plist-3.6.0/lib/plist/parser.rb:40
  def open=(_arg0); end

  # include REXML::StreamListener
  #
  # source://plist-3.6.0/lib/plist/parser.rb:40
  def result; end

  # include REXML::StreamListener
  #
  # source://plist-3.6.0/lib/plist/parser.rb:40
  def result=(_arg0); end

  # source://plist-3.6.0/lib/plist/parser.rb:58
  def tag_end(name); end

  # source://plist-3.6.0/lib/plist/parser.rb:47
  def tag_start(name, attributes); end

  # source://plist-3.6.0/lib/plist/parser.rb:51
  def text(contents); end
end

# source://plist-3.6.0/lib/plist/parser.rb:203
class Plist::PArray < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:204
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:243
class Plist::PData < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:244
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:236
class Plist::PDate < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:237
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:173
class Plist::PDict < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:174
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:223
class Plist::PFalse < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:224
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:211
class Plist::PInteger < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:212
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:191
class Plist::PKey < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:192
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:167
class Plist::PList < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:168
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:229
class Plist::PReal < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:230
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:197
class Plist::PString < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:198
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:144
class Plist::PTag
  # @return [PTag] a new instance of PTag
  #
  # source://plist-3.6.0/lib/plist/parser.rb:158
  def initialize; end

  # Returns the value of attribute children.
  #
  # source://plist-3.6.0/lib/plist/parser.rb:157
  def children; end

  # Sets the attribute children
  #
  # @param value the value to set the attribute children to.
  #
  # source://plist-3.6.0/lib/plist/parser.rb:157
  def children=(_arg0); end

  # Returns the value of attribute text.
  #
  # source://plist-3.6.0/lib/plist/parser.rb:157
  def text; end

  # Sets the attribute text
  #
  # @param value the value to set the attribute text to.
  #
  # source://plist-3.6.0/lib/plist/parser.rb:157
  def text=(_arg0); end

  # source://plist-3.6.0/lib/plist/parser.rb:162
  def to_ruby; end

  class << self
    # @private
    #
    # source://plist-3.6.0/lib/plist/parser.rb:149
    def inherited(sub_class); end

    # source://plist-3.6.0/lib/plist/parser.rb:145
    def mappings; end
  end
end

# source://plist-3.6.0/lib/plist/parser.rb:217
class Plist::PTrue < ::Plist::PTag
  # source://plist-3.6.0/lib/plist/parser.rb:218
  def to_ruby; end
end

# source://plist-3.6.0/lib/plist/parser.rb:68
class Plist::StreamParser
  # @return [StreamParser] a new instance of StreamParser
  #
  # source://plist-3.6.0/lib/plist/parser.rb:69
  def initialize(plist_data_or_file, listener); end

  # source://plist-3.6.0/lib/plist/parser.rb:90
  def parse; end

  private

  # source://plist-3.6.0/lib/plist/parser.rb:129
  def parse_encoding_from_xml_declaration(xml_declaration); end
end

# source://plist-3.6.0/lib/plist/parser.rb:82
Plist::StreamParser::CDATA = T.let(T.unsafe(nil), Regexp)

# source://plist-3.6.0/lib/plist/parser.rb:86
Plist::StreamParser::COMMENT_END = T.let(T.unsafe(nil), Regexp)

# source://plist-3.6.0/lib/plist/parser.rb:85
Plist::StreamParser::COMMENT_START = T.let(T.unsafe(nil), Regexp)

# source://plist-3.6.0/lib/plist/parser.rb:84
Plist::StreamParser::DOCTYPE_PATTERN = T.let(T.unsafe(nil), Regexp)

# source://plist-3.6.0/lib/plist/parser.rb:81
Plist::StreamParser::TEXT = T.let(T.unsafe(nil), Regexp)

# source://plist-3.6.0/lib/plist/parser.rb:87
Plist::StreamParser::UNIMPLEMENTED_ERROR = T.let(T.unsafe(nil), String)

# source://plist-3.6.0/lib/plist/parser.rb:83
Plist::StreamParser::XMLDECL_PATTERN = T.let(T.unsafe(nil), Regexp)

# Raised when an element is not implemented
#
# source://plist-3.6.0/lib/plist/parser.rb:17
class Plist::UnimplementedElementError < ::RuntimeError; end

# source://plist-3.6.0/lib/plist/version.rb:4
Plist::VERSION = T.let(T.unsafe(nil), String)
