require 'byebug'
require_relative '00_tree_node.rb'
class KnightPathFinder
    def self.valid_moves(pos)
        # debugger
        row, col = pos
        possible = [[row+2, col+1],[row+2, col-1],[row+1, col+2],[row+1, col-2],[row-2, col+1],[row-2, col-1],[row-1, col+2],[row-1, col-2]]
        
        possible.select do |position|
            x, y = position
            # debugger
            x < 8 && x >= 0 && y < 8 && y >= 0
            #     c = a - x
            #     d = y - b
            #     return true if (c.abs == 1 && d.abs == 2) || (c.abs == 2 && d.abs == 1)
            # end
        end
    end


    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        build_move_tree(@root_node)
    end

    attr_reader :root_node
    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos).reject { |ele| @considered_positions.include?(ele)}.each { |posit|  @considered_positions << posit }
    end

    def find_path(pos)

    end

    def build_move_tree(root)
        nodes = [@root_node]
        # startPos = @considered_positions.shift
        until nodes.empty?
            newMove = nodes.shift
            new_move_positions(newMove.value).each do |child|
                newNode = PolyTreeNode.new(child)
                newMove.add_child(newNode)
                nodes << newNode
            end
        end
        p @considered_positions.length
    end

    
    def find_path(end_pos)
        queue = [@root_node]
        until queue.empty?
            shifted = queue.shift
            end_node = shifted if end_pos == shifted.value
            queue += shifted.children
        end
        trace_back_path(end_node)
    end

    def trace_back_path(end_node)
        current_node = end_node
        trace_path = [end_node.value]
        until current_node == @root_node
            parent = current_node.parent
            trace_path.unshift(parent.value)
            current_node = parent
        end

        return trace_path
    end

end