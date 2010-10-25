# Autogenerated from a Treetop grammar. Edits may be lost.


module MiniSQL
  include Treetop::Runtime

  def root
    @root ||= :expression
  end

  module Expression0
    def subexp
      elements[1]
    end

  end

  module Expression1
    def compile
      subexp.compile
    end
  end

  def _nt_expression
    start_index = index
    if node_cache[:expression].has_key?(index)
      cached = node_cache[:expression][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt__
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      i3 = index
      r4 = _nt_create_table_exp
      if r4
        r3 = r4
      else
        r5 = _nt_drop_table_exp
        if r5
          r3 = r5
        else
          @index = i3
          r3 = nil
        end
      end
      s0 << r3
      if r3
        r7 = _nt__
        if r7
          r6 = r7
        else
          r6 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r6
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Expression0)
      r0.extend(Expression1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:expression][start_index] = r0

    r0
  end

  module CreateTableExp0
    def CREATE
      elements[1]
    end

    def _1
      elements[2]
    end

    def TABLE
      elements[3]
    end

    def _2
      elements[4]
    end

    def name
      elements[5]
    end

    def column_seq
      elements[9]
    end

    def primary_key_exp
      elements[10]
    end

  end

  module CreateTableExp1
    def compile
      rst={}
      rst[:name]=name.text_value.downcase
      rst[:columns]=column_seq.compile
      rst[:primary_key]=primary_key_exp.compile
      [:create_table, rst]
    end
  end

  def _nt_create_table_exp
    start_index = index
    if node_cache[:create_table_exp].has_key?(index)
      cached = node_cache[:create_table_exp][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt__
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_CREATE
      s0 << r3
      if r3
        r4 = _nt__
        s0 << r4
        if r4
          r5 = _nt_TABLE
          s0 << r5
          if r5
            r6 = _nt__
            s0 << r6
            if r6
              r7 = _nt_name
              s0 << r7
              if r7
                r9 = _nt__
                if r9
                  r8 = r9
                else
                  r8 = instantiate_node(SyntaxNode,input, index...index)
                end
                s0 << r8
                if r8
                  if has_terminal?('(', false, index)
                    r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure('(')
                    r10 = nil
                  end
                  s0 << r10
                  if r10
                    r12 = _nt__
                    if r12
                      r11 = r12
                    else
                      r11 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r11
                    if r11
                      r13 = _nt_column_seq
                      s0 << r13
                      if r13
                        r14 = _nt_primary_key_exp
                        s0 << r14
                        if r14
                          if has_terminal?(')', false, index)
                            r15 = instantiate_node(SyntaxNode,input, index...(index + 1))
                            @index += 1
                          else
                            terminal_parse_failure(')')
                            r15 = nil
                          end
                          s0 << r15
                          if r15
                            r17 = _nt__
                            if r17
                              r16 = r17
                            else
                              r16 = instantiate_node(SyntaxNode,input, index...index)
                            end
                            s0 << r16
                            if r16
                              if has_terminal?(';', false, index)
                                r18 = instantiate_node(SyntaxNode,input, index...(index + 1))
                                @index += 1
                              else
                                terminal_parse_failure(';')
                                r18 = nil
                              end
                              s0 << r18
                              if r18
                                r20 = _nt__
                                if r20
                                  r19 = r20
                                else
                                  r19 = instantiate_node(SyntaxNode,input, index...index)
                                end
                                s0 << r19
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CreateTableExp0)
      r0.extend(CreateTableExp1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:create_table_exp][start_index] = r0

    r0
  end

  module ColumnSeq0
    def columns
      elements[0]
    end

  end

  module ColumnSeq1
    def compile
      columns.elements.map { |e| e.compile }
    end
  end

  def _nt_column_seq
    start_index = index
    if node_cache[:column_seq].has_key?(index)
      cached = node_cache[:column_seq][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      r2 = _nt_column_exp
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      r4 = _nt__
      if r4
        r3 = r4
      else
        r3 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ColumnSeq0)
      r0.extend(ColumnSeq1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:column_seq][start_index] = r0

    r0
  end

  module ColumnExp0
    def _
      elements[0]
    end

    def UNIQUE
      elements[1]
    end
  end

  module ColumnExp1
    def name
      elements[1]
    end

    def _
      elements[2]
    end

    def type
      elements[3]
    end

  end

  module ColumnExp2
    def compile
      rst={}
      rst[:name]=name.text_value
      rst[:type]=type.text_value
      rst[:unique]=true unless UNIQUE.text_value.strip.empty?
      rst
    end
  end

  def _nt_column_exp
    start_index = index
    if node_cache[:column_exp].has_key?(index)
      cached = node_cache[:column_exp][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt__
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_name
      s0 << r3
      if r3
        r4 = _nt__
        s0 << r4
        if r4
          r5 = _nt_type
          s0 << r5
          if r5
            i7, s7 = index, []
            r8 = _nt__
            s7 << r8
            if r8
              r9 = _nt_UNIQUE
              s7 << r9
            end
            if s7.last
              r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
              r7.extend(ColumnExp0)
            else
              @index = i7
              r7 = nil
            end
            if r7
              r6 = r7
            else
              r6 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r6
            if r6
              r11 = _nt__
              if r11
                r10 = r11
              else
                r10 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r10
              if r10
                if has_terminal?(',', false, index)
                  r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure(',')
                  r12 = nil
                end
                s0 << r12
                if r12
                  r14 = _nt__
                  if r14
                    r13 = r14
                  else
                    r13 = instantiate_node(SyntaxNode,input, index...index)
                  end
                  s0 << r13
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ColumnExp1)
      r0.extend(ColumnExp2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:column_exp][start_index] = r0

    r0
  end

  module PrimaryKeyExp0
    def PRIMARY
      elements[1]
    end

    def _
      elements[2]
    end

    def KEY
      elements[3]
    end

    def name
      elements[7]
    end

  end

  module PrimaryKeyExp1
    def compile
      name.text_value
    end
  end

  def _nt_primary_key_exp
    start_index = index
    if node_cache[:primary_key_exp].has_key?(index)
      cached = node_cache[:primary_key_exp][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt__
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_PRIMARY
      s0 << r3
      if r3
        r4 = _nt__
        s0 << r4
        if r4
          r5 = _nt_KEY
          s0 << r5
          if r5
            r7 = _nt__
            if r7
              r6 = r7
            else
              r6 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r6
            if r6
              if has_terminal?('(', false, index)
                r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure('(')
                r8 = nil
              end
              s0 << r8
              if r8
                r10 = _nt__
                if r10
                  r9 = r10
                else
                  r9 = instantiate_node(SyntaxNode,input, index...index)
                end
                s0 << r9
                if r9
                  r11 = _nt_name
                  s0 << r11
                  if r11
                    r13 = _nt__
                    if r13
                      r12 = r13
                    else
                      r12 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r12
                    if r12
                      if has_terminal?(')', false, index)
                        r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
                        @index += 1
                      else
                        terminal_parse_failure(')')
                        r14 = nil
                      end
                      s0 << r14
                      if r14
                        r16 = _nt__
                        if r16
                          r15 = r16
                        else
                          r15 = instantiate_node(SyntaxNode,input, index...index)
                        end
                        s0 << r15
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(PrimaryKeyExp0)
      r0.extend(PrimaryKeyExp1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:primary_key_exp][start_index] = r0

    r0
  end

  module DropTableExp0
    def DROP
      elements[1]
    end

    def _1
      elements[2]
    end

    def TABLE
      elements[3]
    end

    def _2
      elements[4]
    end

    def name
      elements[5]
    end

  end

  module DropTableExp1
    def compile
      [:drop_table, name.text_value]
    end
  end

  def _nt_drop_table_exp
    start_index = index
    if node_cache[:drop_table_exp].has_key?(index)
      cached = node_cache[:drop_table_exp][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt__
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_DROP
      s0 << r3
      if r3
        r4 = _nt__
        s0 << r4
        if r4
          r5 = _nt_TABLE
          s0 << r5
          if r5
            r6 = _nt__
            s0 << r6
            if r6
              r7 = _nt_name
              s0 << r7
              if r7
                r9 = _nt__
                if r9
                  r8 = r9
                else
                  r8 = instantiate_node(SyntaxNode,input, index...index)
                end
                s0 << r8
                if r8
                  if has_terminal?(';', false, index)
                    r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure(';')
                    r10 = nil
                  end
                  s0 << r10
                  if r10
                    r12 = _nt__
                    if r12
                      r11 = r12
                    else
                      r11 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r11
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(DropTableExp0)
      r0.extend(DropTableExp1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:drop_table_exp][start_index] = r0

    r0
  end

  def _nt_type
    start_index = index
    if node_cache[:type].has_key?(index)
      cached = node_cache[:type][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_INT
    if r1
      r0 = r1
    else
      r2 = _nt_FLOAT
      if r2
        r0 = r2
      else
        r3 = _nt_char_type
        if r3
          r0 = r3
        else
          @index = i0
          r0 = nil
        end
      end
    end

    node_cache[:type][start_index] = r0

    r0
  end

  module CharType0
    def CHAR
      elements[1]
    end

    def number
      elements[5]
    end

  end

  def _nt_char_type
    start_index = index
    if node_cache[:char_type].has_key?(index)
      cached = node_cache[:char_type][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt__
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_CHAR
      s0 << r3
      if r3
        r5 = _nt__
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          if has_terminal?('(', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('(')
            r6 = nil
          end
          s0 << r6
          if r6
            r8 = _nt__
            if r8
              r7 = r8
            else
              r7 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r7
            if r7
              r9 = _nt_number
              s0 << r9
              if r9
                r11 = _nt__
                if r11
                  r10 = r11
                else
                  r10 = instantiate_node(SyntaxNode,input, index...index)
                end
                s0 << r10
                if r10
                  if has_terminal?(')', false, index)
                    r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure(')')
                    r12 = nil
                  end
                  s0 << r12
                  if r12
                    r14 = _nt__
                    if r14
                      r13 = r14
                    else
                      r13 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r13
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CharType0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:char_type][start_index] = r0

    r0
  end

  module Name0
  end

  def _nt_name
    start_index = index
    if node_cache[:name].has_key?(index)
      cached = node_cache[:name][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[a-zA-Z_]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9a-zA-Z_]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Name0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:name][start_index] = r0

    r0
  end

  module Number0
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[1-9]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Number0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:number][start_index] = r0

    r0
  end

  def _nt__
    start_index = index
    if node_cache[:_].has_key?(index)
      cached = node_cache[:_][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[ \\n\\r\\t]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:_][start_index] = r0

    r0
  end

  def _nt_CHAR
    start_index = index
    if node_cache[:CHAR].has_key?(index)
      cached = node_cache[:CHAR][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('char', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 4))
      @index += 4
    else
      terminal_parse_failure('char')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('CHAR', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 4))
        @index += 4
      else
        terminal_parse_failure('CHAR')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:CHAR][start_index] = r0

    r0
  end

  def _nt_CREATE
    start_index = index
    if node_cache[:CREATE].has_key?(index)
      cached = node_cache[:CREATE][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('create', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure('create')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('CREATE', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 6))
        @index += 6
      else
        terminal_parse_failure('CREATE')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:CREATE][start_index] = r0

    r0
  end

  def _nt_DROP
    start_index = index
    if node_cache[:DROP].has_key?(index)
      cached = node_cache[:DROP][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('drop', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 4))
      @index += 4
    else
      terminal_parse_failure('drop')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('DROP', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 4))
        @index += 4
      else
        terminal_parse_failure('DROP')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:DROP][start_index] = r0

    r0
  end

  def _nt_FLOAT
    start_index = index
    if node_cache[:FLOAT].has_key?(index)
      cached = node_cache[:FLOAT][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('float', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 5))
      @index += 5
    else
      terminal_parse_failure('float')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('FLOAT', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 5))
        @index += 5
      else
        terminal_parse_failure('FLOAT')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:FLOAT][start_index] = r0

    r0
  end

  def _nt_INT
    start_index = index
    if node_cache[:INT].has_key?(index)
      cached = node_cache[:INT][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('int', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('int')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('INT', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('INT')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:INT][start_index] = r0

    r0
  end

  def _nt_KEY
    start_index = index
    if node_cache[:KEY].has_key?(index)
      cached = node_cache[:KEY][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('key', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('key')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('KEY', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('KEY')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:KEY][start_index] = r0

    r0
  end

  def _nt_PRIMARY
    start_index = index
    if node_cache[:PRIMARY].has_key?(index)
      cached = node_cache[:PRIMARY][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('primary', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 7))
      @index += 7
    else
      terminal_parse_failure('primary')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('PRIMARY', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 7))
        @index += 7
      else
        terminal_parse_failure('PRIMARY')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:PRIMARY][start_index] = r0

    r0
  end

  def _nt_TABLE
    start_index = index
    if node_cache[:TABLE].has_key?(index)
      cached = node_cache[:TABLE][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('table', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 5))
      @index += 5
    else
      terminal_parse_failure('table')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('TABLE', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 5))
        @index += 5
      else
        terminal_parse_failure('TABLE')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:TABLE][start_index] = r0

    r0
  end

  def _nt_UNIQUE
    start_index = index
    if node_cache[:UNIQUE].has_key?(index)
      cached = node_cache[:UNIQUE][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('unique', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure('unique')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('UNIQUE', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 6))
        @index += 6
      else
        terminal_parse_failure('UNIQUE')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:UNIQUE][start_index] = r0

    r0
  end

end

class MiniSQLParser < Treetop::Runtime::CompiledParser
  include MiniSQL
end


# vim: filetype=ruby