import pynvim
import os

@pynvim.plugin
class CommentHistory(object):

    def __init__(self, nvim):
        self.nvim = nvim
        self.comment_file = os.environ.get("DOVERS_COMMENT_FILE", None)

    @pynvim.command('CommentHistory', nargs='*')
    def commentHistory(self, args):
        if not self.comment_file :
            self.nvim.out_write("No comment file loaded.\n")

        question = args[0] if len(args) > 0 else None
        comment  = args[1] if len(args) > 1 else None

        self.nvim.command("split {}".format( self.comment_file ) )
        return
        
        # TODO
        if not question :
            self.nvim.out_write("You must specify a question\n")
        else :
            if comment :
                self.nvim.current.line = ('Comment {} for question {} in in file {}:'
                                          .format(comment, question, comment_file))
            else :
                self.nvim.command("split {}".format( self.comment_file ) )
                #self.nvim.current.line = ('Comments for question {} in file {}:'
                #                           .format(question, self.comment_file))
