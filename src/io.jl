
"""
    load_sigmf(f; mmap=true, integrity_check=true)

f is a string pointing to the location of a SigMF file. In practice,
few data sets are proper ".sigmf" files, but rather pairs of ".sigmf-data" and ".sigmf-meta" files.
In this case you may point to them with the ".sigmf" extension and the loader will
attempt to correct the extensions to load both.

Returns a `SigMFFile`.
"""
function load(f; mmap=true, integrity_check=true)

    exists = isfile(f)
    if !exists
        @warn "$f not found, attempting with .sigm-meta and .sigm-data extensions"
        metafile = f*"-meta"
        datafile = f*"-data"
        dataexists = isfile(datafile)
        metaexists = isfile(metafile)
        !dataexists && !metaexists && error("Could not locate data and meta SigMF files")
    else
        error("TODO: TAR")
    end

    meta = open(metafile, "r") do f
        JSON3.read(f, SigMFMeta)
    end

    # determine data type from meta
    datatype, endianness = datatype_sigmf2julia(meta.meta_global.datatype)

    dataio = open(datafile, "r")
    data = mmap ? Mmap.mmap(dataio) : read(dataio)

    # integrity checks
    hassha = meta.meta_global.sha512 !== nothing
    integrity_check && !hassha && @warn "SigMF metadata does not contain a SHA512 hash, skipping integrity checks"
    integrity_check = integrity_check && !hassha
    integrity_check && sha512(dataio) != meta.meta_global.sha512 && error("SigMF data integrity check failed")

    SigMFFile(meta, reinterpret(datatype, data))
end