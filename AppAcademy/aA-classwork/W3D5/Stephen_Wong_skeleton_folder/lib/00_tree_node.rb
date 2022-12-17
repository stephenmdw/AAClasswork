require "byebug"
class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    
    attr_reader :parent, :children, :value

    def parent=(parent)
        return if @parent == parent
        if @parent != nil && parent != nil
            self.parent.children.delete(self)
            @parent = parent
            @parent.children << self
        elsif parent == nil
            self.parent.children.delete(self) if self.parent
            @parent = parent
        else #@parent == nil || parent !=nil
            @parent = parent
            @parent.children << self
        end
    end
#node is a parent and we are transferring the children of the node to the new parent's childrens
#resetting the parent to be the parent of that node
# node. parent = (Newparent)
# self.parent = newparent

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
        raise error if child.parent == nil
    end

    def dfs(target)
        return self if target == self.value
        # return nil if self == nil 
        @children.each do |child|
            result = child.dfs(target)          
            return result unless result.nil?                                                    
        end
        nil
    end
   
    def bfs(target)
        # return self if self.value == target
        queue = [self]        

        until queue.empty?
            # debugger
            shifted = queue.shift
            # puts shifted.value
            return shifted if target == shifted.value
            # shifted.children.each do |child|
            #     queue << child
            # end
            queue += shifted.children 
        end
        nil
    end
end