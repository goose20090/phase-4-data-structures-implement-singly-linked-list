require_relative './node'
require 'byebug'

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend node

        if !head
            self.head = node
            return
        end

        node.next_node = self.head
        self.head = node

    end

    def append node

        if !head
            self.head = node
            return 
        end

        last_node = head

        until last_node.next_node == nil
            last_node = last_node.next_node
        end

        last_node.next_node = node
    end

    def delete_head
        if head
            self.head = self.head.next_node
        end
    end

    def delete_tail

        if !self.head
            return
        elsif !self.head.next_node
            self.head = nil
            return
        end

        last_node = self.head

        second_last_node = ''

        until last_node.next_node == nil
            second_last_node = last_node
            last_node = last_node.next_node
        end

        second_last_node.next_node = nil
    end

    def add_after index, node
        current_index = 0

        correct_node = self.head

        until index == current_index
            correct_node = self.head.next_node
            current_index+= 1
        end

        node.next_node = correct_node.next_node
        correct_node.next_node = node
    end


    def search data

        correct_node = self.head

        until correct_node.data == data
            correct_node = correct_node.next_node
        end

        correct_node
    end
end
