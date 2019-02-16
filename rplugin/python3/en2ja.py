
#
# :echo En2Ja('dark')
# 暗い 濃い 暗闇 闇 暗黒
#
import json
import urllib.request as UrlReq
import pynvim

WNUM = 5

@pynvim.plugin
class En2Ja(object):

    def __init__(self, nvim):
        self.nvim = nvim

    def translate(self, word):
        FromLang = 'en'
        DestLang = 'ja'

        ApiUrl = "https://glosbe.com/gapi/translate?from="\
            + FromLang + "&dest=" + DestLang\
            + "&format=json&phrase=" + word + "&pretty=true"

        Response = UrlReq.urlopen(ApiUrl)
        JsonData = Response.read()
        JsonDict = json.loads(JsonData)

        Ans = ''
        tuc = JsonDict['tuc']

        for i in range(WNUM):
            if u'phrase' in tuc[i].keys():
                Ans += tuc[i]['phrase']['text'] + ' '
        return Ans

    @pynvim.function("En2Ja", sync=True)
    def en2ja(self, args):
        return self.translate(args[0])

    @pynvim.command("En2Ja", range='', nargs='*')
    def en2jacommand(self, args, range):
        ans = self.translate(args[0])
        self.nvim.command('echo \'' + ans + '\'')
