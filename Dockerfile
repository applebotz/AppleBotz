# Ultroid - UserBot
# Copyright (C) 2021-2022 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM theteamultroid/ultroid:main

# set timezone
ENV TZ=Asia/Jakarta

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    # cloning the repo and installing requirements.
    && git clone https://github.com/AppleBotz/AppleBotz.git /root/applebotz/ \
    && pip3 install --no-cache-dir -r root/applebotz/requirements.txt \
    && pip3 install av --no-binary av

# changing workdir
WORKDIR /root/applebotz/

# start the bot
CMD ["bash", "startup"]
