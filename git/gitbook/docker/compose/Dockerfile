FROM mrhuangyuhui/gitbook

RUN npm config set registry https://registry.npm.taobao.org -g

RUN mkdir /mybook

WORKDIR /mybook

COPY book.json /mybook/

RUN gitbook install

COPY . /mybook/
