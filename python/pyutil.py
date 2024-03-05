import os, requests, shutil
import difflib
import math
import scipy.special

def system(cmd, verbose=True):
    if verbose: print(cmd)
    os.system(cmd)
    
def IFELSE(b, x, y):
    if b: return x
    return y

def cp(f0, f1, verbose=False):
    if verbose: print('cp %s %s' % (f0, f1), flush=True)
    shutil.copy2(f0, f1)
def mv(f0, f1, verbose=False):
    if verbose: print('mv %s %s' % (f0, f1), flush=True)
    shutil.move(f0, f1)
def mkdir(dir_='questions', verbose=False):
    if verbose: print('mkdir %s' % dir_, flush=True)    
    os.makedirs(dir_)
def rm(filename, verbose=False):
    if verbose: print('rm %s' % filename, flush=True)    
    os.remove(filename)
def readfile(path, format=None):
    '''
    format = 'r' or 'rb'. Default 'r'.
    '''
    if format==None:
        f = open(path, 'r')
    else:
        f = open(path, format)
    return f.read()

def writefile(path, s, format='utf-8'):
    assert isinstance(s, (str, bytes)), "s = %s is not str/bytes" % s
    if isinstance(s, bytes):
        f = open(path, 'wb')
    else:
        s = bytes(s, 'utf-8')
        f = open(path, 'wb')
    f.write(s)
    f.close()
    
def myrequests_get(url, stream=False, allow_redirects=True):
    """This is basically requests.get except that raise_for_status is called"""
    try:
        r = requests.get(url, stream=stream, allow_redirects=allow_redirects)
        r.raise_for_status()
    except Exception as e:
        print("ERROR: requests.get to %s status code %s\n\n%s" % (url, r.status_code, e))
        raise
    return r

def save_url(url, stream=False, allow_redirects=True, chunksize=1024*1024,
             destdir=None, destpath=None,
             verbose=False):
    """ save url to path """
    if destdir==None: destdir = '.'
    if destpath==None: destpath = os.path.split(url)[-1]
    destpath = os.path.join(destdir, destpath)
    # Create subdirs if necessary
    dirs, filename = os.path.split(destpath)
    if dirs != '':
        os.makedirs(dirs, exist_ok=True)
        
    if chunksize==None:
        if verbose: print('%s -> %s' % (url, destpath))
        r = myrequests_get(url, stream)
        writefile(destpath, r.content)
    else:
        done = 0
        r = myrequests_get(url, stream=True)
        #total_length = '?'
        #try:
        #    total_length = int(r.headers.get('Content-Length', None))
        #    if total_length == None:
        #        total_length = '?'
        #    input("content length: %s .... " % total_length)
        #except:
        #    total_length = '?'
        output = '%s -> %s [%sb]'
        f = open(destpath, 'wb')    
        for chunk in r.iter_content(chunksize):
            f.write(chunk)
            done += len(chunk)
            if verbose:
                s = output % (url, destpath, done)
                print(s + (len(s)*'\b'), end='')
        f.close()    
        if verbose:
            print()
    
def wget(url, dest=None, verbose=True, chunksize=None):
    save_url(url=url, destpath=dest, verbose=verbose, chunksize=chunksize)
    
def download_github(user='yliow', repo=None, path=None,
                    chunksize=None,
                    destpath=None,
                    destdir=None,
                    verbose=True):
    url = 'https://raw.githubusercontent.com/%s/%s/master/%s' % (user, repo, path)
    stream = True
    if chunksize==None: stream = False
    save_url(url, stream=stream,
             destdir=destdir, destpath=destpath, chunksize=chunksize,
             verbose=verbose)
    
def difffiles(path1, path2, cleanup=True):
    """ returns True if files different """
    system('diff "%s" "%s" > diff.txt' % (path1, path2), verbose=False)
    s = readfile('diff.txt').strip()
    if cleanup: rm('diff.txt')
    return s

def fact(n):
    return math.factorial(n)

def c(n,r):
    return scipy.special.comb(n, r, exact=True)


if __name__ == '__main__':
    print("\ntesting dowload_github text data test1 ...")
    download_github(repo='latextool', path='latextool_basic.py', destdir='test1')
    if difffiles('test1/latextool_basic.py', '../latextool/latextool_basic.py'):
        raise Exception("different")
    print("pass")

    print("\ntesting dowload_github text data test2 ...")
    download_github(repo='latextool', path='latextool_basic.py', destdir='test2', chunksize=1)
    if difffiles('test2/latextool_basic.py', '../latextool/latextool_basic.py'):
        raise Exception("different")
    print("pass")
        
    print("\ntesting wget text data test3 ...")
    wget(url='http://yliow.github.io/index.html', dest='test3/index.html')
    if difffiles('test3/index.html', '../yliow.github.io/index.html'):
        raise Exception("different")
    print("pass")
    
    print("\ntesting wget text data stream test4 ...")
    wget(url='http://yliow.github.io/index.html', dest='test4/index.html', chunksize=1, verbose=True)
    if difffiles('test4/index.html', '../yliow.github.io/index.html'):
        raise Exception("different")
    print("pass")
        
    print("\ntesting wget binary data test5 ...")
    wget(url='http://yliow.github.io/pdfs/make/main.pdf', dest='test5/main.pdf')
    if difffiles('test5/main.pdf', '../yliow.github.io/pdfs/make/main.pdf'):
        raise Exception("different")
    print("pass")
        
    print("\ntesting wget binary data stream test6 ...")
    wget(url='http://yliow.github.io/pdfs/make/main.pdf', dest='test6/main.pdf', chunksize=1, verbose=True)
    if difffiles('test6/main.pdf', '../yliow.github.io/pdfs/make/main.pdf'):
        raise Exception("different")
    print("pass")

    print()
